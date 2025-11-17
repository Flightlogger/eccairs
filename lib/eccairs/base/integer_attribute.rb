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
        return record_error("Value must be an integer, got #{value.class}", value) if value.is_a?(Array) || value.is_a?(Hash) || value.is_a?(Float)

        integer_value = Integer(value)
        return record_error("Value #{integer_value} is less than minimum of #{self.class.min}", value) if self.class.min && integer_value < self.class.min
        record_error("Value #{integer_value} is greater than maximum of #{self.class.max}", value) if self.class.max && integer_value > self.class.max
      rescue ArgumentError
        record_error("Value must be an integer, got #{value.class}", value)
      end
    end
  end
end
