# frozen_string_literal: true

module Eccairs
  module Entities
    class AircraftNarrative < Eccairs::Base::Entity
      entity_id "22"
      xml_tag "Narrative"

      belongs_to :aircraft

      # Narrative attributes
      has_many :narrative_language, class_name: "Eccairs::Attributes::NarrativeLanguage"
      has_many :narrative_text, class_name: "Eccairs::Attributes::NarrativeText"
    end
  end
end

