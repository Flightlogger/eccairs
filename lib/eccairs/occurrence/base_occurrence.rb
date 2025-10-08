# frozen_string_literal: true

module Eccairs::Occurrence
  class BaseOccurrence
    attr_reader :attributes

    def initialize
      @attributes = {}
    end

    def add_attribute(key, value)
      @attributes[key] = value
      self
    end

    # DSL method to set entity_id at class level
    def self.entity_id(value = nil)
      if value
        @entity_id = value.to_s
      else
        @entity_id || "24" # Default is "24" for Occurrence entity
      end
    end

    # DSL method to set attribute_id at class level
    def self.attribute_id(value = nil)
      if value
        @attribute_id = value.to_s
      else
        @attribute_id
      end
    end

    def to_xml(xml)
      xml.Occurrence(entityId: self.class.entity_id) do
        xml.ATTRIBUTES do
          build_attributes(xml)
        end
      end
    end

    protected

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

    private

    def build_attributes(xml)
      attributes.each do |key, value|
        xml.send(key, value)
      end
    end
  end
end
