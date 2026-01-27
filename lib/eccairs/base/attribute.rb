# frozen_string_literal: true

module Eccairs
  module Base
    class Attribute
      attr_reader :value

      # DSL method to set attribute_id at class level
      def self.attribute_id(value = nil)
        return @attribute_id unless value
        @attribute_id = value.to_s
      end

      # DSL method to set xml_tag at class level
      def self.xml_tag(value = nil)
        return @xml_tag unless value
        @xml_tag = value.to_s
      end

      # DSL method to set sequence at class level (for XML ordering)
      def self.sequence(value = nil)
        return @sequence || 999 unless value
        @sequence = value.to_i
      end

      # DSL method to set unit for XML attribute (e.g., "C", "kt", "Hour(s)")
      def self.unit(value = nil)
        return @unit unless value
        @unit = value.to_s
      end

      # DSL method to mark attribute as dt:Text type (requires PlainText child element)
      def self.text_type(value = nil)
        return @text_type unless value
        @text_type = value
      end

      # DSL method to represent an attribute as a complex value using an ECCAIRS
      # dataTypes child element (dt namespace).
      #
      # Example:
      #   dt_child "FileName" { |v| File.basename(v) }
      #
      # Generates:
      #   <MyTag attributeId="...">
      #     <dt:FileName>...</dt:FileName>
      #   </MyTag>
      #
      # Notes:
      # - `text_type true` is treated as `dt_child "PlainText"` unless a dt_child is explicitly set.
      def self.dt_child(tag = nil, &transform)
        return @dt_child if tag.nil?

        @dt_child = {
          tag: tag.to_s,
          transform: transform
        }
      end

      def self.dt_child_tag
        @dt_child&.fetch(:tag, nil)
      end

      def self.dt_child_transform
        @dt_child&.fetch(:transform, nil)
      end

      def initialize(value = nil)
        self.value = value
      end

      def value=(new_value)
        @value_before_validation = @value
        validate_value(new_value)
        # Only set @value if validate_value didn't already set it
        @value = new_value if @value == @value_before_validation
      end

      # Method to build XML for this attribute
      def build_xml(xml)
        return unless value

        raise NotImplementedError, "Subclasses must define xml_tag" unless self.class.xml_tag

        attrs = {attributeId: self.class.attribute_id}
        attrs[:Unit] = self.class.unit if self.class.unit

        dt_tag = self.class.dt_child_tag
        dt_transform = self.class.dt_child_transform

        # For complex (dataTypes) attributes, use a dt:* child element
        if dt_tag || self.class.text_type
          dt_tag ||= "PlainText"
          dt_value = dt_transform ? dt_transform.call(value) : value

          xml.send(self.class.xml_tag, attrs) do
            xml["dt"].send(dt_tag, dt_value)
          end
        else
          # For regular attributes, use direct text content
          xml.send(self.class.xml_tag, value, attrs)
        end
      end

      protected

      # Hook for subclasses to validate the value
      def validate_value(value)
        # Base implementation does nothing
      end
    end
  end
end
