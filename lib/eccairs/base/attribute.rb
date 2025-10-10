# frozen_string_literal: true

module Eccairs
  module Base
    class Attribute
      attr_reader :value

      # DSL method to set attribute_id at class level
      def self.attribute_id(value = nil)
        if value
          @attribute_id = value.to_s
        else
          @attribute_id
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

      # DSL method to set sequence at class level (for XML ordering)
      def self.sequence(value = nil)
        if value
          @sequence = value.to_i
        else
          @sequence || 999 # Default to high number if not set
        end
      end

      # DSL method to set unit for XML attribute (e.g., "C", "kt", "Hour(s)")
      def self.unit(value = nil)
        if value
          @unit = value.to_s
        else
          @unit
        end
      end

      def initialize(value = nil)
        self.value = value
      end

      def value=(new_value)
        validate_value(new_value)
        @value = new_value
      end

      # Method to build XML for this attribute
      # Can be overridden by subclasses for custom behavior
      def build_xml(xml)
        return unless value

        tag_name = self.class.xml_tag
        raise NotImplementedError, "Subclasses must define xml_tag" unless tag_name

        xml_attributes = {attributeId: self.class.attribute_id}
        xml_attributes[:Unit] = self.class.unit if self.class.unit

        xml.send(tag_name, value, xml_attributes)
      end

      protected

      # Hook for subclasses to validate the value
      # Override in typed attribute subclasses for custom validation logic
      def validate_value(value)
        # Base implementation does nothing - subclasses override this
      end
    end
  end
end

