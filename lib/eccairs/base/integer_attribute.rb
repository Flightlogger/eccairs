# frozen_string_literal: true

module Eccairs
  module Base
    class IntegerAttribute < Attribute
      # DSL method to set min at class level
      def self.min(value = nil)
        return @min unless value
        @min = value.to_i
      end

      # DSL method to set max at class level
      def self.max(value = nil)
        return @max unless value
        @max = value.to_i
      end

      protected

      def validate_value(value)
        return if value.nil?

        raise ArgumentError, "Value must be an integer, got #{value.class}" if value.is_a?(Array) || value.is_a?(Hash) || value.is_a?(Float)

        integer_value = Integer(value)
        raise ArgumentError, "Value #{integer_value} is less than minimum of #{self.class.min}" if self.class.min && integer_value < self.class.min
        raise ArgumentError, "Value #{integer_value} is greater than maximum of #{self.class.max}" if self.class.max && integer_value > self.class.max
      rescue ArgumentError => e
        raise if e.message.include?("less than minimum") || e.message.include?("greater than maximum")
        raise ArgumentError, "Value must be an integer, got #{value.class}"
      end
    end
  end
end
