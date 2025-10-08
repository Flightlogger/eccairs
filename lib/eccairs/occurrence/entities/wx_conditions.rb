# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class WxConditions < BaseEntity
        attribute_id 127
        xml_tag "Wx_Conditions"
        sequence 1
        validates_inclusion within: {
          VMC: 1,
          IMC: 2,
          UNKNOWN: 99
        }
      end
    end
  end
end
