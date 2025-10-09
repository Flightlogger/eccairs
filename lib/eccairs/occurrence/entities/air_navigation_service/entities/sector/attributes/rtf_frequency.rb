# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Entities
          module Sector
            module Attributes
              class RtfFrequency < Eccairs::Base::Entity
                attribute_id 619
                xml_tag "RTF_Frequency"
                sequence 3
                unit "kHz"

                validates_numericality min: -999999, max: 999999, type: :decimal
              end
            end
          end
        end
      end
    end
  end
end
