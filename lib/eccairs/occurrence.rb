# frozen_string_literal: true

module Eccairs
  module Occurrence
    class Base
      ENTITY_ID = "24"

      attr_reader :entities, :nested_entities

      def initialize
        @entities = []
        @nested_entities = []
      end

      def add_entity(entity)
        # Check if entity is a nested entity (has to_xml method) or a simple attribute entity (has build_xml method)
        if entity.respond_to?(:to_xml) && !entity.respond_to?(:build_xml)
          @nested_entities << entity
        else
          @entities << entity
        end
        self
      end

      def to_xml(xml)
        xml.Occurrence(entityId: ENTITY_ID) do
          # Group entities by their module namespace
          # Occurrence::Attributes::* -> ATTRIBUTES section (direct occurrence attributes)
          # Occurrence::Entities::*::Attributes::* -> ENTITIES section (entity attributes)
          attribute_entities = @entities.select { |e| e.class.name.match?(/::Occurrence::Attributes::[^:]+$/) }
          entity_entities = @entities.select { |e| e.class.name.match?(/::Occurrence::Entities::.+::Attributes::/) }

          # Build ATTRIBUTES section for direct occurrence attributes
          build_attributes_section(xml, attribute_entities) if attribute_entities.any?

          # Build ENTITIES section for nested entities
          build_entities_section(xml, entity_entities) if entity_entities.any? || @nested_entities.any?
        end
      end

      private

      def build_attributes_section(xml, entities)
        xml.ATTRIBUTES do
          sorted_entities = entities.sort_by { |entity| entity.class.sequence }
          sorted_entities.each do |entity|
            entity.build_xml(xml)
          end
        end
      end

      def build_entities_section(xml, entity_entities = [])
        xml.ENTITIES do
          # Group entity_entities by their parent entity module
          grouped_by_parent = entity_entities.group_by { |e| get_parent_entity_info(e) }

          # Build each parent entity wrapper
          grouped_by_parent.each do |(parent_tag, parent_entity_id), entities|
            xml.send(parent_tag, entityId: parent_entity_id) do
              xml.ATTRIBUTES do
                sorted_entities = entities.sort_by { |entity| entity.class.sequence }
                sorted_entities.each do |entity|
                  entity.build_xml(xml)
                end
              end
            end
          end

          # Then, add other nested entities
          @nested_entities.each do |nested_entity|
            nested_entity.to_xml(xml)
          end
        end
      end

      def get_parent_entity_info(entity)
        # Extract parent entity info from module name
        # e.g., Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude
        # -> ["Aerodrome_General", "1"]
        parts = entity.class.name.split('::')
        # Find the parent entity module (between Entities and Attributes)
        entities_index = parts.index('Entities')
        attributes_index = parts.index('Attributes')
        parent_module = parts[entities_index + 1] # e.g., "AerodromeGeneral"
        parent_tag = parent_module.gsub(/([a-z])([A-Z])/, '\1_\2') # e.g., "Aerodrome_General"
        parent_entity_id = entity.class.parent_entity_id || "1" # Get from class or default

        [parent_tag, parent_entity_id]
      end
    end
  end
end
