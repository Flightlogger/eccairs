# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module SeparationAircraft
          module Attributes
            class HeightAltitude < Eccairs::BaseEntity
              attribute_id 597
              xml_tag "Height_Altitude"
              sequence 4
              validates_numericality min: -999999, max: 999999, type: :decimal

              def additional_xml_attributes
                { Unit: "ft" }
              end
            end
          end
        end
      end
    end
  end
end
