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
          # Group entities by their section module relative to Eccairs::Occurrence
          grouped = @entities.group_by { |e| extract_section_module(e) }

          grouped.each do |section_module, section_entities|
            build_section(xml, section_module, section_entities)
          end
        end
      end

      private

      def extract_section_module(entity)
        # Remove "Eccairs::Occurrence::" prefix and get the section module
        # e.g., Eccairs::Occurrence::Attributes::DewPoint -> Attributes
        # e.g., Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude
        #       -> Entities::AerodromeGeneral
        relative_path = entity.class.name.sub('Eccairs::Occurrence::', '')
        parts = relative_path.split('::')

        # If there are more than 2 parts, it's nested (e.g., Entities::AerodromeGeneral::Attributes::...)
        # Take first 2 parts. Otherwise, just take the first part (e.g., Attributes::DewPoint)
        parts.length > 2 ? parts[0..1].join('::') : parts.first
      end

      def build_section(xml, section_path, entities)
        # Section path is like "Attributes" or "Entities::AerodromeGeneral"
        section_name = section_path.split('::').first.upcase.to_sym

        xml.send(section_name) do
          if section_name == :ENTITIES
            # For nested entities, group by parent module and build entity XML
            entities.group_by { |e| extract_section_module(e) }.each do |module_path, grouped_entities|
              parent_module = Object.const_get("Eccairs::Occurrence::#{module_path}")
              parent_module.build_entity_xml(xml, grouped_entities.sort_by { |e| e.class.sequence })
            end
          else
            # For direct attributes, just build XML for each
            entities.sort_by { |e| e.class.sequence }.each { |e| e.build_xml(xml) }
          end
        end
      end
    end
  end
end
