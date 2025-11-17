# frozen_string_literal: true

module Eccairs
  module Base
    class StringAttribute < Attribute
      # DSL method to set max_length at class level
      def self.max_length(value = nil)
        return @max_length unless value
        @max_length = value.to_i
      end

      protected

      def validate_value(value)
        return if value.nil?

        unless value.is_a?(String)
          record_error("Value must be a string, got #{value.class}", value)
          return
        end

        if self.class.max_length && value.length > self.class.max_length
          record_error("String length #{value.length} exceeds maximum of #{self.class.max_length}", value)
          nil
        end
      end
    end
  end
end
