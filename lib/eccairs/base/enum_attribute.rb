# frozen_string_literal: true

module Eccairs
  module Base
    class EnumAttribute < Attribute
      # DSL method to set allowed_values at class level
      # Can be an array of integers or a hash of symbolic names to integers
      def self.allowed_values(values = nil)
        if values
          if values.is_a?(Hash)
            @allowed_values_hash = values
            @allowed_values = values.values
            # Define constants for each symbolic name
            values.each do |name, value|
              const_set(name, value) unless const_defined?(name)
            end
          else
            @allowed_values = values
            @allowed_values_hash = nil
          end
        else
          @allowed_values
        end
      end

      def self.allowed_values_hash
        @allowed_values_hash
      end

      protected

      def validate_value(value)
        return if value.nil?
        return unless self.class.allowed_values

        numeric_value = resolve_value(value)
        return if numeric_value.nil?

        return record_error("Value #{value} is not in allowed values: #{self.class.allowed_values.join(", ")}", value) unless self.class.allowed_values.include?(numeric_value)

        @value = numeric_value
      end

      def resolve_value(value)
        return value if value.is_a?(Integer)

        resolved = resolve_from_hash(value) if self.class.allowed_values_hash
        return resolved if resolved

        return Integer(value) if value.is_a?(String)

        record_error("Cannot resolve value to an allowed enum value", value)
        nil
      rescue ArgumentError
        record_error("Cannot resolve value to an allowed enum value", value)
        nil
      end

      def resolve_from_hash(value)
        hash = self.class.allowed_values_hash
        return hash[value] if hash.key?(value)

        if value.is_a?(Symbol) || value.is_a?(String)
          upper_key = value.to_s.upcase.to_sym
          return hash[upper_key] if hash.key?(upper_key)

          sym_key = value.to_sym if value.is_a?(String)
          return hash[sym_key] if sym_key && hash.key?(sym_key)
        end

        nil
      end
    end
  end
end
