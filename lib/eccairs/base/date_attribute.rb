# frozen_string_literal: true

require "date"
require "time"

module Eccairs
  module Base
    class DateAttribute < Attribute
      protected

      def validate_value(value)
        return if value.nil?

        if value.is_a?(Date) && !value.is_a?(DateTime)
          @value = value.iso8601
        elsif value.is_a?(Time) || value.is_a?(DateTime)
          @value = Date.new(value.year, value.month, value.day).iso8601
        elsif value.is_a?(String)
          date_string = value.include?("T") ? value.split("T").first : value
          return record_error("Date must be in YYYY-MM-DD format", value) unless date_string.match?(/\A\d{4}-\d{2}-\d{2}\z/)

          Date.iso8601(date_string)
          @value = date_string
        else
          record_error("Value must be a Date, Time, DateTime, or ISO 8601 date string, got #{value.class}", value)
        end
      rescue Date::Error => e
        record_error("Invalid date format: #{e.message}", value)
      end
    end
  end
end
