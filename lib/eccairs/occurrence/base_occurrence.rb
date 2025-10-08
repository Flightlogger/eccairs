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

    # DSL method to set entity_id at class level
    def self.entity_id(value = nil)
      if value
        @entity_id = value.to_s
      else
        @entity_id || "24" # Default is "24" for Occurrence entity
      end
    end

    # DSL method to set attribute_id at class level
    def self.attribute_id(value = nil)
      if value
        @attribute_id = value.to_s
      else
        @attribute_id
      end
    end

    def to_xml(xml)
      xml.Occurrence(entityId: self.class.entity_id) do
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
