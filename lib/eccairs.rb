# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

module Eccairs
  class Error < StandardError; end

  class ValidationError
    attr_reader :field_name, :attribute_id, :provided_value, :message

    def initialize(field_name:, attribute_id:, provided_value:, message:)
      @field_name = field_name
      @attribute_id = attribute_id
      @provided_value = provided_value
      @message = message
    end

    def to_s
      "#{field_name} (ID: #{attribute_id}): #{message} (provided: #{provided_value.inspect})"
    end

    def to_h
      {
        field_name: field_name,
        attribute_id: attribute_id,
        provided_value: provided_value,
        message: message
      }
    end
  end

  def self.set
    Eccairs::Set.new
  end
end
