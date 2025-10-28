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

        if self.class.text_type
          # For dt:Text attributes, use PlainText child element
          xml.send(self.class.xml_tag, attrs) do
            xml.parent.namespace = xml.parent.namespace_definitions.find { |ns| ns.prefix == "db" }
            xml["dt"].PlainText(value)
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
