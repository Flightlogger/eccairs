# frozen_string_literal: true

require "date"

module Eccairs
  module Base
    class DateEntity < Entity
      protected

      # Validate date values
      # Accepts Date objects, Time objects, or strings
      def validate_value(value)
        return unless value # nil values are optional

        # Accept Date, Time, or String - be lenient for flexibility
        return if value.is_a?(Date) || value.is_a?(Time) || value.is_a?(String)

        raise Eccairs::ValidationError, "value must be a Date, Time, or String, got #{value.class}"
      end
    end
  end
end
