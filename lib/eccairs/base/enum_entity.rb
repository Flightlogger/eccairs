# frozen_string_literal: true

module Eccairs
  module Base
    class EnumEntity < Entity
      # DSL method to set allowed values
      def self.allowed_values(values = nil)
        if values
          if values.is_a?(Hash)
            # Define constants from hash keys
            values.each { |name, value| const_set(name, value) unless const_defined?(name) }
            @enum_mapping = values
            @allowed_values = values.values
          else
            @allowed_values = values
          end
        else
          @allowed_values || []
        end
      end

      def self.enum_mapping
        @enum_mapping || {}
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

      protected

      # Validate enum values
      def validate_value(value)
        return unless value # nil values are optional

        allowed = self.class.allowed_values
        return if allowed.empty? # no validation if no allowed values defined

        unless allowed.include?(value)
          raise Eccairs::ValidationError, "value must be one of: #{allowed.join(", ")} (got #{value})"
        end
      end
    end
  end
end
