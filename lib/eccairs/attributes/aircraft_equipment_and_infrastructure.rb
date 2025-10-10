# frozen_string_literal: true

module Eccairs
  module Attributes
    class AircraftEquipmentAndInfrastructure < Eccairs::Base::EnumAttribute
      attribute_id 1098
      xml_tag "Aircraft_Equipment_And_Infrastructure"
      sequence 8
      allowed_values [1, 2, 3, 4, 5, 6]
    end
  end
end
