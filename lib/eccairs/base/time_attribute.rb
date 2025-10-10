# frozen_string_literal: true

require "time"

module Eccairs
  module Base
    class TimeAttribute < Attribute
      protected

      def validate_value(value)
        return if value.nil?

        # Accept Time objects or strings in ISO 8601 format (HH:MM:SS)
        if value.is_a?(Time)
          @value = value.strftime("%H:%M:%S")
        elsif value.is_a?(String)
          # Validate the format (HH:MM:SS)
          unless value.match?(/\A\d{2}:\d{2}:\d{2}\z/)
            raise ArgumentError, "Time must be in HH:MM:SS format"
          end
          @value = value
        else
          raise ArgumentError, "Value must be a Time or time string (HH:MM:SS), got #{value.class}"
        end
      end
    end
  end
end
