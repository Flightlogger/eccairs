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
          raise ArgumentError, "Time must be in HH:MM:SS format" unless value.match?(/\A\d{2}:\d{2}:\d{2}\z/)

          hour, minute, second = value.split(":").map(&:to_i)
          raise ArgumentError, "Time must be in HH:MM:SS format" if hour > 23 || minute > 59 || second > 59

          @value = value
        else
          raise ArgumentError, "Value must be a Time or time string (HH:MM:SS), got #{value.class}"
        end
      end
    end
  end
end
