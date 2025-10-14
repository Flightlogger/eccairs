# frozen_string_literal: true

module Eccairs
  module Base
    class Entity
      attr_reader :attributes, :children, :parent

      # DSL method to set entity_id at class level
      def self.entity_id(value = nil)
        return @entity_id unless value
        @entity_id = value.to_s
      end

      # DSL method to set xml_tag at class level
      def self.xml_tag(value = nil)
        return @xml_tag unless value
        @xml_tag = value.to_s
      end

      # DSL method to indicate if this entity requires an ID attribute
      def self.requires_id(value = true)
        @requires_id = value
      end

      def self.requires_id?
        @requires_id || false
      end

      # DSL method to set sequence at class level (for XML ordering)
      def self.sequence(value = nil)
        return @sequence || 999 unless value
        @sequence = value.to_i
      end

      attr_writer :parent
      attr_accessor :id

      def initialize
        @attributes = {}
        @children = {}
        @parent = nil
        @id = nil
      end

      private

      # Helper method for explicit add_attribute methods
      def add_attribute(klass, is_has_one, *args)
        instance = klass.new(*args)
        name = klass.xml_tag.downcase.to_sym

        if is_has_one
          @attributes[name] = instance
        else
          (@attributes[name] ||= []) << instance
        end

        instance
      end

      # Helper method for explicit add_entity methods
      def add_entity(klass, is_has_one, id: nil, &block)
        instance = klass.new
        instance.parent = self
        instance.id = id if id && klass.requires_id?
        name = klass.xml_tag.downcase.to_sym

        if is_has_one
          @children[name] = instance
        else
          (@children[name] ||= []) << instance
        end

        block&.call(instance)
        instance
      end

      public

      # Build XML for this entity
      def build_xml(xml, entity_id_counters = {})
        xml.send(self.class.xml_tag, build_xml_attributes(entity_id_counters)) do
          build_attributes_section(xml) if @attributes&.any?
          build_entities_section(xml, entity_id_counters) if @children&.any?
        end
      end

      private

      def build_xml_attributes(entity_id_counters)
        attrs = {}
        attrs[:entityId] = self.class.entity_id if self.class.entity_id

        if self.class.requires_id?
          entity_name = self.class.name&.split("::")&.last || self.class.xml_tag
          entity_id_counters[entity_name] ||= 0
          entity_id_counters[entity_name] += 1
          attrs[:ID] = "#{entity_name}_#{entity_id_counters[entity_name]}"
        end

        attrs
      end

      def build_attributes_section(xml)
        xml.ATTRIBUTES do
          @attributes.values.flatten.sort_by { |attr| attr.class.sequence }.each do |attr|
            attr.build_xml(xml)
          end
        end
      end

      def build_entities_section(xml, entity_id_counters)
        xml.ENTITIES do
          all_children = @children.values.flatten
          all_children.sort_by { |child| child.class.sequence }.each do |child|
            child.build_xml(xml, entity_id_counters)
          end
        end
      end

      public

      # Get all attributes recursively
      def all_attributes
        attrs = @attributes.values.flatten
        @children.values.flatten.each do |child|
          attrs.concat(child.all_attributes) if child.respond_to?(:all_attributes)
        end
        attrs
      end
    end
  end
end
