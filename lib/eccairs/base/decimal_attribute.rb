# frozen_string_literal: true

module Eccairs
  module Base
    class DecimalAttribute < Attribute
      # DSL method to set min at class level
      def self.min(value = nil)
        if value
          @min = value.to_f
        else
          @min
        end
      end

      # DSL method to set max at class level
      def self.max(value = nil)
        if value
          @max = value.to_f
        else
          @max
        end
      end

      protected

      def validate_value(value)
        return if value.nil?

        numeric_value = Float(value)

        min = self.class.min
        if min && numeric_value < min
          raise ArgumentError, "Value #{numeric_value} is less than minimum of #{min}"
        end

        max = self.class.max
        if max && numeric_value > max
          raise ArgumentError, "Value #{numeric_value} is greater than maximum of #{max}"
        end
      rescue ArgumentError => e
        raise unless e.message.include?("invalid value for Float")
        raise ArgumentError, "Value must be numeric, got #{value.class}"
      end
    end
  end
end
