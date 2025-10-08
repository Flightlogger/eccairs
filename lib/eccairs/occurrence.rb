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
          occurrence_attributes, entity_attributes = partition_entities

          build_attributes_section(xml, occurrence_attributes) if occurrence_attributes.any?
          build_entities_section(xml, entity_attributes) if entity_attributes.any?
        end
      end

      private

      def partition_entities
        occurrence_attributes = []
        entity_attributes = []

        @entities.each do |entity|
          if entity.class.name.include?('::Occurrence::Entities::')
            entity_attributes << entity
          else
            occurrence_attributes << entity
          end
        end

        [occurrence_attributes, entity_attributes]
      end

      def build_attributes_section(xml, entities)
        xml.ATTRIBUTES do
          entities.sort_by { |e| e.class.sequence }.each { |e| e.build_xml(xml) }
        end
      end

      def build_entities_section(xml, entities)
        xml.ENTITIES do
          entities.group_by { |e| extract_parent_module(e) }.each do |parent_module, grouped_entities|
            parent_module.build_entity_xml(xml, grouped_entities)
          end
        end
      end

      def extract_parent_module(entity)
        # Extract parent entity module from class name
        # e.g., Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude
        # -> Eccairs::Occurrence::Entities::AerodromeGeneral
        parts = entity.class.name.split('::')
        entities_index = parts.index('Entities')
        parent_module_name = parts[0..entities_index + 1].join('::')
        Object.const_get(parent_module_name)
      end
    end
  end
end
