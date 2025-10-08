# frozen_string_literal: true

module Eccairs::Occurrence
  class BaseOccurrence
    attr_reader :attributes

    def initialize
      @attributes = {}
    end

    def add_attribute(key, value)
      @attributes[key] = value
      self
    end

    def to_xml(xml)
      xml.Occurrence do
        xml.ATTRIBUTES do
          build_attributes(xml)
        end
      end
    end

    private

    def build_attributes(xml)
      attributes.each do |key, value|
        xml.send(key, value)
      end
    end
  end
end
