# frozen_string_literal: true

module Eccairs
  module Attributes
    class StcaCurrentAlerting < Eccairs::Base::EnumAttribute
      attribute_id 379
      xml_tag "STCA_Current_Alerting"
      sequence 4
      allowed_values [1, 2, 99, 100]
    end
  end
end
