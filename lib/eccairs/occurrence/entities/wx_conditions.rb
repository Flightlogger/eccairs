# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class WxConditions < BaseEntity
        attribute_id 127
        xml_tag "Wx_Conditions"
        validates_inclusion within: [1, 2, 99]
      end
    end
  end
end
