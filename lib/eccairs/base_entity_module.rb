# frozen_string_literal: true

module Eccairs
  # Module to be extended by entity modules (e.g., AerodromeGeneral)
  # Provides DSL methods for defining entity metadata and XML generation
  module BaseEntityModule
    # DSL method to set entity_id at module level
    def entity_id(value = nil)
      if value
        @entity_id = value.to_s
      else
        @entity_id
      end
    end

    # DSL method to set xml_tag at module level
    def xml_tag(value = nil)
      if value
        @xml_tag = value.to_s
      else
        @xml_tag
      end
    end

    # DSL method to indicate if this entity requires an ID attribute (for key constraints)
    def requires_id(value = true)
      @requires_id = value
    end

    def requires_id?
      @requires_id || false
    end

    # Build XML for this entity with its attributes
    def build_entity_xml(xml, entities)
      xml.send(xml_tag, entityId: entity_id) do
        xml.ATTRIBUTES do
          entities.sort_by { |e| e.class.sequence }.each { |e| e.build_xml(xml) }
        end
      end
    end
  end
end
