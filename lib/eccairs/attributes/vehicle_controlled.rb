# frozen_string_literal: true

module Eccairs
  module Attributes
    class VehicleControlled < Eccairs::Base::EnumAttribute
      attribute_id 743
      xml_tag "Vehicle_Controlled"
      sequence 1
      allowed_values(
        YES: 1,
        NO: 2,
        UNKNOWN: 99
        )
    end
  end
end
