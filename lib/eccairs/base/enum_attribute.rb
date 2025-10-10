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

        allowed = self.class.allowed_values
        return unless allowed

        # Convert symbolic names or strings to integers
        numeric_value = resolve_value(value)

        unless allowed.include?(numeric_value)
          raise ArgumentError, "Value #{value} is not in allowed values: #{allowed.join(", ")}"
        end

        # Store the numeric value
        @value = numeric_value
      end

      def resolve_value(value)
        # If it's already an integer, return it
        return value if value.is_a?(Integer)

        # Try to resolve from symbolic constants
        hash = self.class.allowed_values_hash
        if hash
          # Try as symbol
          return hash[value] if value.is_a?(Symbol) && hash.key?(value)
          
          # Try as string
          symbol_key = value.to_s.upcase.to_sym
          return hash[symbol_key] if hash.key?(symbol_key)
        end

        # Try to convert to integer
        Integer(value)
      rescue ArgumentError
        raise ArgumentError, "Cannot resolve value #{value} to an allowed enum value"
      end
    end
  end
end

