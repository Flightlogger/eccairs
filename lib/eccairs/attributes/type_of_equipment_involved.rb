# frozen_string_literal: true

module Eccairs
  module Attributes
    class TypeOfEquipmentInvolved < Eccairs::Base::EnumAttribute
      attribute_id 1120
      xml_tag "Type_Of_Equipment_Involved"
      sequence 4
      allowed_values (1..28).to_a
    end
  end
end
