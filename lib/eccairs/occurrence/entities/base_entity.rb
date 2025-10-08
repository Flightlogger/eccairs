# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class BaseEntity
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

        def initialize(value = nil)
          self.value = value
        end

        def value=(new_value)
          validate_value(new_value)
          @value = new_value
        end

        # Method to build XML for this entity's attribute
        # Can be overridden by subclasses for custom behavior
        def build_xml(xml)
          return unless value

          tag_name = self.class.xml_tag
          raise NotImplementedError, "Subclasses must define xml_tag" unless tag_name

          xml_attributes = { attributeId: self.class.attribute_id }
          xml_attributes.merge!(additional_xml_attributes) if respond_to?(:additional_xml_attributes, true)

          xml.send(tag_name, value, xml_attributes)
        end

        protected

        # Hook for subclasses to validate the value
        # Override this method to add validation logic
        def validate_value(value)
          # Default: no validation
        end

        # Helper method to validate a numeric value - raises ValidationError if invalid
        def validate_numeric!(attribute_name, value, min: nil, max: nil, type: :decimal)
          return if value.nil? # nil values are optional

          unless value.is_a?(Numeric)
            raise Eccairs::ValidationError, "#{attribute_name} must be a number, got #{value.class}"
          end

          if min && value < min
            raise Eccairs::ValidationError, "#{attribute_name} must be greater than or equal to #{min} (got #{value})"
          end

          if max && value > max
            raise Eccairs::ValidationError, "#{attribute_name} must be less than or equal to #{max} (got #{value})"
          end
        end

        # Helper method to validate a string value - raises ValidationError if invalid
        def validate_string!(attribute_name, value, max_length: nil)
          return if value.nil? # nil values are optional

          unless value.is_a?(String)
            raise Eccairs::ValidationError, "#{attribute_name} must be a string, got #{value.class}"
          end

          if max_length && value.length > max_length
            raise Eccairs::ValidationError, "#{attribute_name} must be at most #{max_length} characters (got #{value.length})"
          end
        end

        # Helper method to validate an enum value - raises ValidationError if invalid
        def validate_enum!(attribute_name, value, allowed_values:)
          return if value.nil? # nil values are optional

          unless allowed_values.include?(value)
            raise Eccairs::ValidationError, "#{attribute_name} must be one of: #{allowed_values.join(', ')} (got #{value})"
          end
        end
      end
    end
  end
end
