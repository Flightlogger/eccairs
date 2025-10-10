# frozen_string_literal: true

module Eccairs
  module Attributes
    class RimcasAlerting < Eccairs::Base::EnumAttribute
      attribute_id 366
      xml_tag "RIMCAS_Alerting"
      sequence 1
      allowed_values [1, 2, 99, 100]
    end
  end
end
