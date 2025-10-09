# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Entities
          module SeparationAircraft
            module Attributes
              class HeightAltitude < Eccairs::Base::Entity
                attribute_id 597
                xml_tag "Height_Altitude"
                sequence 4
                unit "ft"

                validates_numericality min: -999999, max: 999999, type: :decimal
              end
            end
          end
        end
      end
    end
  end
end
