# frozen_string_literal: true

module Eccairs
  module Occurrence
    class Base
      ENTITY_ID = "24"

      attr_reader :entities

      def initialize
        @entities = []
      end

      def add_entity(entity)
        @entities << entity
        self
      end

      def to_xml(xml)
        xml.Occurrence(entityId: ENTITY_ID) do
          xml.ATTRIBUTES do
            @entities.each do |entity|
              entity.build_xml(xml)
            end
          end
        end
      end
    end
  end
end
