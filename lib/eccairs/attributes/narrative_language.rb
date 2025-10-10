# frozen_string_literal: true

module Eccairs
  module Attributes
    class NarrativeLanguage < Eccairs::Base::EnumAttribute
      attribute_id 424
      xml_tag "Narrative_Language"
      sequence 0
      allowed_values (1..66).to_a
    end
  end
end
