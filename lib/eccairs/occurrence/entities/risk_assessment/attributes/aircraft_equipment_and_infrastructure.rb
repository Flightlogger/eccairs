# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class AircraftEquipmentAndInfrastructure < Eccairs::Base::Entity
            attribute_id 1098
            xml_tag "Aircraft_Equipment_And_Infrastructure"
            sequence 8
            validates_inclusion within: [1, 2, 3, 4, 5, 6]
          end
        end
      end
    end
  end
end
