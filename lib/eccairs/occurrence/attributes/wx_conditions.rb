# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class WxConditions < Eccairs::Base::EnumEntity
        attribute_id 127
        xml_tag "Wx_Conditions"
        sequence 1
        allowed_values(
          VMC: 1,
          IMC: 2,
          UNKNOWN: 99
        )
      end
    end
  end
end
