# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class DangGoodsInvolved < BaseEntity
        attribute_id 129
        xml_tag "Dang_Goods_Involved"
        validates_inclusion within: [1, 2, 99]
      end
    end
  end
end

