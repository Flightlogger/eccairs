# frozen_string_literal: true

module Eccairs
  module Base
    class TimeEntity < Entity
      protected

      # Validate time values
      # Accepts Time objects or strings - be lenient for flexibility
      def validate_value(value)
        return unless value # nil values are optional

        # Accept Time or String - be lenient for flexibility
        return if value.is_a?(Time) || value.is_a?(String)

        raise Eccairs::ValidationError, "value must be a Time or String, got #{value.class}"
      end
    end
  end
end
