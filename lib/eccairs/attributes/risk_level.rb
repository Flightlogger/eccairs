# frozen_string_literal: true

module Eccairs
  module Attributes
    class RiskLevel < Eccairs::Base::DecimalAttribute
      attribute_id 940
      xml_tag "Risk_Level"
      sequence 2
      min(-999999)
      max 999999
    end
  end
end
