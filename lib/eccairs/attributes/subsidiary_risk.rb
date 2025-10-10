# frozen_string_literal: true

module Eccairs
  module Attributes
    class SubsidiaryRisk < Eccairs::Base::EnumAttribute
      attribute_id 1055
      xml_tag "Subsidiary_Risk"
      sequence 5
      allowed_values [3, 4, 5, 6, 7, 8, 9, 10, 1, 2]
    end
  end
end
