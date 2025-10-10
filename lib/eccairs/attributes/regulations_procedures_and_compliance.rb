# frozen_string_literal: true

module Eccairs
  module Attributes
    class RegulationsProceduresAndCompliance < Eccairs::Base::EnumAttribute
      attribute_id 1100
      xml_tag "Regulations_Procedures_And_Compliance"
      sequence 10
      allowed_values [1, 2, 3, 4, 5, 6]
    end
  end
end
