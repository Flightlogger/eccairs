# frozen_string_literal: true

module Eccairs
  module Base
    class Entity
      attr_reader :attributes, :children, :parent

      # DSL method to set entity_id at class level
      def self.entity_id(value = nil)
        if value
          @entity_id = value.to_s
        else
          @entity_id
        end
      end

      # DSL method to set xml_tag at class level
      def self.xml_tag(value = nil)
        if value
          @xml_tag = value.to_s
        else
          @xml_tag
        end
      end

      # DSL method to indicate if this entity requires an ID attribute (for key constraints)
      def self.requires_id(value = true)
        @requires_id = value
      end

      def self.requires_id?
        @requires_id || false
      end

      # Store relationship definitions
      def self.relationships
        @relationships ||= {}
      end

      # DSL method to define has_many relationship
      def self.has_many(name, class_name:)
        relationships[name] = {type: :has_many, class_name: class_name}

        # Define add_* method for builder pattern
        define_method("add_#{name}") do |*args, &block|
          klass = Object.const_get(class_name)

          # Check if the class is an Entity or Attribute
          is_entity = klass.ancestors.include?(Eccairs::Base::Entity)

          if is_entity
            # Entity relationship - create instance and yield for builder pattern if block given
            instance = klass.new
            instance.parent = self
            @children[name] ||= []
            @children[name] << instance
            block.call(instance) if block
            instance
          else
            # Attribute relationship - create attribute with value
            instance = klass.new(*args)
            @attributes[name] ||= []
            @attributes[name] << instance
            instance
          end
        end
      end

      # DSL method to define has_one relationship
      def self.has_one(name, class_name:)
        relationships[name] = {type: :has_one, class_name: class_name}

        # Define add_* method for builder pattern
        define_method("add_#{name}") do |*args, &block|
          klass = Object.const_get(class_name)

          # Check if the class is an Entity or Attribute
          is_entity = klass.ancestors.include?(Eccairs::Base::Entity)

          if is_entity
            # Entity relationship - create instance and yield for builder pattern if block given
            instance = klass.new
            instance.parent = self
            @children[name] = instance
            block.call(instance) if block
            instance
          else
            # Attribute relationship - create attribute with value
            instance = klass.new(*args)
            @attributes[name] = instance
            instance
          end
        end
      end

      # DSL method to define belongs_to relationship
      def self.belongs_to(name)
        relationships[name] = {type: :belongs_to}
      end

      def initialize
        @attributes = {}
        @children = {}
        @parent = nil
      end

      attr_writer :parent

      # Build XML for this entity
      def build_xml(xml, entity_id_counters = {})
        xml_attributes = {entityId: self.class.entity_id}

        # Add ID attribute if required
        if self.class.requires_id?
          entity_name = self.class.name.split("::").last
          entity_id_counters[entity_name] ||= 0
          entity_id_counters[entity_name] += 1
          xml_attributes[:ID] = "#{entity_name}_#{entity_id_counters[entity_name]}"
        end

        xml.send(self.class.xml_tag, xml_attributes) do
          # Build ATTRIBUTES section
          if @attributes.any?
            xml.ATTRIBUTES do
              # Flatten all attributes and sort by sequence
              all_attributes = @attributes.values.flatten
              all_attributes.sort_by { |attr| attr.class.sequence }.each do |attr|
                attr.build_xml(xml)
              end
            end
          end

          # Build ENTITIES section
          if @children.any?
            xml.ENTITIES do
              # Process all child entities
              @children.each do |_name, child_or_children|
                if child_or_children.is_a?(Array)
                  child_or_children.each { |child| child.build_xml(xml, entity_id_counters) }
                else
                  child_or_children.build_xml(xml, entity_id_counters)
                end
              end
            end
          end
        end
      end

      # Get all attributes recursively for validation
      def all_attributes
        attrs = @attributes.values.flatten
        @children.each do |_name, child_or_children|
          if child_or_children.is_a?(Array)
            child_or_children.each { |child| attrs.concat(child.all_attributes) if child.respond_to?(:all_attributes) }
          elsif child_or_children.respond_to?(:all_attributes)
            attrs.concat(child_or_children.all_attributes)
          end
        end
        attrs
      end
    end
  end
end
