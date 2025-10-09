# frozen_string_literal: true

module Eccairs
  module Base
    class StringEntity < Entity
      # DSL method to set maximum length constraint
      def self.max_length(value = nil)
        if value
          @max_length = value
        else
          @max_length
        end
      end

      # DSL method to wrap text content in a specific XML element (e.g., PlainText)
      def self.wrap_text_in(wrapper_element)
        @text_wrapper = wrapper_element.to_s
      end

      def self.text_wrapper
        @text_wrapper
      end

      # Override build_xml to handle text wrapping for string entities
      def build_xml(xml)
        return unless value

        tag_name = self.class.xml_tag
        raise NotImplementedError, "Subclasses must define xml_tag" unless tag_name

        xml_attributes = {attributeId: self.class.attribute_id}
        xml_attributes[:Unit] = self.class.unit if self.class.unit

        # Check if text should be wrapped in a special element (e.g., PlainText)
        if self.class.text_wrapper
          xml.send(tag_name, xml_attributes) do
            xml["dt"].send(self.class.text_wrapper, value)
          end
        else
          xml.send(tag_name, value, xml_attributes)
        end
      end

      protected

      # Validate string values
      def validate_value(value)
        return unless value # nil values are optional

        unless value.is_a?(String)
          raise Eccairs::ValidationError, "value must be a string, got #{value.class}"
        end

        max_len = self.class.max_length
        if max_len && value.length > max_len
          raise Eccairs::ValidationError, "value must be at most #{max_len} characters (got #{value.length})"
        end
      end
    end
  end
end
