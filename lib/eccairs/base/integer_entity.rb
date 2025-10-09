# frozen_string_literal: true

module Eccairs
  module Base
    class IntegerEntity < Entity
      # DSL method to set minimum value constraint
      def self.min(value = nil)
        if value
          @min_value = value
        else
          @min_value
        end
      end

      # DSL method to set maximum value constraint
      def self.max(value = nil)
        if value
          @max_value = value
        else
          @max_value
        end
      end

      protected

      # Validate integer values
      def validate_value(value)
        return unless value # nil values are optional

        unless value.is_a?(Numeric)
          raise Eccairs::ValidationError, "value must be a number, got #{value.class}"
        end

        unless value.is_a?(Integer) || value == value.to_i
          raise Eccairs::ValidationError, "value must be an integer, got #{value}"
        end

        min_val = self.class.min
        max_val = self.class.max

        if min_val && value < min_val
          raise Eccairs::ValidationError, "value must be greater than or equal to #{min_val} (got #{value})"
        end

        if max_val && value > max_val
          raise Eccairs::ValidationError, "value must be less than or equal to #{max_val} (got #{value})"
        end
      end
    end
  end
end

