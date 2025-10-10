# frozen_string_literal: true

module Eccairs
  module Base
    class IntegerAttribute < Attribute
      # DSL method to set min at class level
      def self.min(value = nil)
        if value
          @min = value.to_i
        else
          @min
        end
      end

      # DSL method to set max at class level
      def self.max(value = nil)
        if value
          @max = value.to_i
        else
          @max
        end
      end

      protected

      def validate_value(value)
        return if value.nil?

        integer_value = Integer(value)

        min = self.class.min
        if min && integer_value < min
          raise ArgumentError, "Value #{integer_value} is less than minimum of #{min}"
        end

        max = self.class.max
        if max && integer_value > max
          raise ArgumentError, "Value #{integer_value} is greater than maximum of #{max}"
        end
      rescue ArgumentError => e
        raise unless e.message.include?("invalid value for Integer")
        raise ArgumentError, "Value must be an integer, got #{value.class}"
      end
    end
  end
end
