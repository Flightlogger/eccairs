# frozen_string_literal: true

require "date"

module Eccairs
  module Base
    class DateAttribute < Attribute
      protected

      def validate_value(value)
        return if value.nil?

        # Accept Date objects or strings in ISO 8601 format (YYYY-MM-DD)
        if value.is_a?(Date)
          @value = value.iso8601
        elsif value.is_a?(String)
          # Validate the format
          Date.iso8601(value)
          @value = value
        else
          raise ArgumentError, "Value must be a Date or ISO 8601 date string (YYYY-MM-DD), got #{value.class}"
        end
      rescue Date::Error => e
        raise ArgumentError, "Invalid date format: #{e.message}"
      end
    end
  end
end
