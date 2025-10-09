# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Narrative
          module Attributes
            class NarrativeLanguage < Eccairs::BaseEntity
              attribute_id 424
              xml_tag "Narrative_Language"
              sequence 0
              validates_inclusion within: (1..66).to_a
            end
          end
        end
      end
    end
  end
end
