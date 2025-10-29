# frozen_string_literal: true

module Eccairs
  module Base
    class TextAttribute < Attribute
      # DSL method to set max_length at class level
      def self.max_length(value = nil)
        return @max_length unless value
        @max_length = value.to_i
      end

      protected

      def validate_value(value)
        return if value.nil?

        raise ArgumentError, "Value must be a string, got #{value.class}" unless value.is_a?(String)
        raise ArgumentError, "String length #{value.length} exceeds maximum of #{self.class.max_length}" if self.class.max_length && value.length > self.class.max_length
      end
    end
  end
end
