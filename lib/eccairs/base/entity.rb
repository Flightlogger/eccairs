# frozen_string_literal: true

module Eccairs
  module Base
    class Entity
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

    # DSL method to wrap text content in a specific XML element (e.g., PlainText)
    def self.wrap_text_in(wrapper_element)
      @text_wrapper = wrapper_element.to_s
    end

    def self.text_wrapper
      @text_wrapper
    end

    # DSL method to declare validations at class level
    def self.validates_numericality(min: nil, max: nil, type: :decimal)
      @validation_type = :numeric
      @validation_options = {min: min, max: max, type: type}
    end

    def self.validates_inclusion(within:)
      if within.is_a?(Hash)
        # Define constants from hash keys
        within.each { |name, value| const_set(name, value) unless const_defined?(name) }
        @enum_mapping = within
        @validation_options = {allowed_values: within.values}
      else
        @validation_options = {allowed_values: within}
      end
      @validation_type = :enum
    end

    def self.validation_type
      @validation_type
    end

    def self.validation_options
      @validation_options || {}
    end

    def self.enum_mapping
      @enum_mapping || {}
    end

    def initialize(value = nil)
      self.value = value
    end

    def value=(new_value)
      # Convert enum keys to their integer values if mapping exists
      mapping = self.class.enum_mapping
      if mapping && !mapping.empty? && new_value
        # Try to convert string/symbol keys to their integer values
        converted = if new_value.is_a?(String) || new_value.is_a?(Symbol)
          mapping[new_value] || mapping[new_value.to_sym] || new_value
        else
          new_value
        end
        validate_value(converted)
        @value = converted
      else
        validate_value(new_value)
        @value = new_value
      end
    end

    # Method to build XML for this entity's attribute
    # Can be overridden by subclasses for custom behavior
    def build_xml(xml)
      return unless value

      tag_name = self.class.xml_tag
      raise NotImplementedError, "Subclasses must define xml_tag" unless tag_name

      xml_attributes = {attributeId: self.class.attribute_id}
      xml_attributes.merge!(additional_xml_attributes) if respond_to?(:additional_xml_attributes, true)

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

    # Hook for subclasses to validate the value
    # Uses class-level validation declarations by default
    # Can be overridden for custom validation logic
    def validate_value(value)
      return unless value # nil values are optional

      validation_type = self.class.validation_type
      return unless validation_type # no validation declared

      case validation_type
      when :numeric
        opts = self.class.validation_options
        validate_numeric!(:value, value, **opts)
      when :enum
        opts = self.class.validation_options
        validate_enum!(:value, value, **opts)
      end
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
        raise Eccairs::ValidationError, "#{attribute_name} must be one of: #{allowed_values.join(", ")} (got #{value})"
      end
    end
    end
  end
end
