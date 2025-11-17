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

        if value.is_a?(Array) || value.is_a?(Hash)
          record_error("Value must be numeric, got #{value.class}", value)
          return
        end

        begin
          numeric_value = Float(value)
        rescue ArgumentError
          record_error("Value must be numeric, got #{value.class}", value)
          return
        end

        if self.class.min && numeric_value < self.class.min
          record_error("Value #{numeric_value} is less than minimum of #{self.class.min}", value)
          return
        end

        if self.class.max && numeric_value > self.class.max
          record_error("Value #{numeric_value} is greater than maximum of #{self.class.max}", value)
          return
        end

        # Preserve string representation for scientific notation
        @value = value if value.is_a?(String) && value.match?(/e/i)
      end
    end
  end
end
