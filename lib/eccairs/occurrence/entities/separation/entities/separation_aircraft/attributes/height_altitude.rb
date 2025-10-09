# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Entities
          module SeparationAircraft
            module Attributes
              class HeightAltitude < Eccairs::Base::DecimalEntity
                attribute_id 597
                xml_tag "Height_Altitude"
                sequence 4
                unit "ft"

                min -999999


                max 999999
              end
            end
          end
        end
      end
    end
  end
end
