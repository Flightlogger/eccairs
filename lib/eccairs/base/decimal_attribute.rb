# frozen_string_literal: true

module Eccairs
  module Base
    class DecimalAttribute < Attribute
      # DSL method to set min at class level
      def self.min(value = nil)
        return @min unless value
        @min = value.to_f
      end

      # DSL method to set max at class level
      def self.max(value = nil)
        return @max unless value
        @max = value.to_f
      end

      protected

      def validate_value(value)
        return if value.nil?

        raise ArgumentError, "Value must be numeric, got #{value.class}" if value.is_a?(Array) || value.is_a?(Hash)

        numeric_value = Float(value)
        raise ArgumentError, "Value #{numeric_value} is less than minimum of #{self.class.min}" if self.class.min && numeric_value < self.class.min
        raise ArgumentError, "Value #{numeric_value} is greater than maximum of #{self.class.max}" if self.class.max && numeric_value > self.class.max

        # Preserve string representation for scientific notation
        @value = value if value.is_a?(String) && value.match?(/e/i)
      rescue ArgumentError => e
        raise if e.message.include?("less than minimum") || e.message.include?("greater than maximum")
        raise ArgumentError, "Value must be numeric, got #{value.class}"
      end
    end
  end
end
