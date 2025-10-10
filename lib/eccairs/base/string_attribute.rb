# frozen_string_literal: true

module Eccairs
  module Base
    class StringAttribute < Attribute
      # DSL method to set max_length at class level
      def self.max_length(value = nil)
        if value
          @max_length = value.to_i
        else
          @max_length
        end
      end

      protected

      def validate_value(value)
        return if value.nil?

        unless value.is_a?(String)
          raise ArgumentError, "Value must be a string, got #{value.class}"
        end

        max = self.class.max_length
        if max && value.length > max
          raise ArgumentError, "String length #{value.length} exceeds maximum of #{max}"
        end
      end
    end
  end
end

