# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Entities
          module Narrative
            module Attributes
              class NarrativeText < Eccairs::Base::Entity
                attribute_id 425
                xml_tag "Narrative_Text"
                sequence 1
                wrap_text_in :PlainText
              end
            end
          end
        end
      end
    end
  end
end
