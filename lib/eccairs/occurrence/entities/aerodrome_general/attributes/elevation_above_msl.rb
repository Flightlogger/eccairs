# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class ElevationAboveMsl < Eccairs::BaseEntity
            attribute_id 4
            xml_tag "Elevation_Above_MSL"
            sequence 3
            validates_numericality min: -500, max: 10000, type: :decimal

            protected

            def additional_xml_attributes
              {Unit: "ft"}
            end
          end
        end
      end
    end
  end
end
