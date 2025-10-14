# frozen_string_literal: true

module Eccairs
  module Entities
    class AircraftNarrative < Eccairs::Base::Entity
      entity_id "22"
      xml_tag "Narrative"
      sequence 7
      # Narrative attributes

      # Add narrative language
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::NarrativeLanguage] The created attribute instance
      # @note Attribute ID: 424, XML Tag: Narrative_Language
      def add_narrative_language(value)
        add_attribute(Eccairs::Attributes::NarrativeLanguage, false, value)
      end

      # Add narrative text
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::NarrativeText] The created attribute instance
      # @note Attribute ID: 425, XML Tag: Narrative_Text
      def add_narrative_text(value)
        add_attribute(Eccairs::Attributes::NarrativeText, false, value)
      end
    end
  end
end
