# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class AircraftAltitude < Eccairs::BaseEntity
            attribute_id 22
            xml_tag "Aircraft_Altitude"
            sequence 1
            validates_numericality min: -999999, max: 999999, type: :decimal

            protected

            def additional_xml_attributes
              { Unit: "ft" }
            end
          end
        end
      end
    end
  end
end
