# frozen_string_literal: true

require "time"

module Eccairs
  module Base
    class TimeAttribute < Attribute
      protected

      def validate_value(value)
        return if value.nil?

        if value.is_a?(Time)
          @value = value.strftime("%H:%M:%S")
        elsif value.is_a?(String)
          return record_error("Time must be in HH:MM:SS format", value) unless value.match?(/\A\d{2}:\d{2}:\d{2}\z/)

          hour, minute, second = value.split(":").map(&:to_i)
          return record_error("Time must be in HH:MM:SS format", value) if hour > 23 || minute > 59 || second > 59

          @value = value
        else
          record_error("Value must be a Time or time string (HH:MM:SS), got #{value.class}", value)
        end
      end
    end
  end
end
