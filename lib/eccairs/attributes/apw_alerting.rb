# frozen_string_literal: true

module Eccairs
  module Attributes
    class ApwAlerting < Eccairs::Base::EnumAttribute
      attribute_id 363
      xml_tag "APW_Alerting"
      sequence 0
      allowed_values [1, 2, 99, 100]
    end
  end
end
