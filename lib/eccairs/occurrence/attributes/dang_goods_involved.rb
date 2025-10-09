# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class DangGoodsInvolved < Eccairs::Base::Entity
        attribute_id 129
        xml_tag "Dang_Goods_Involved"
        sequence 2
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          UNKNOWN: 99
        }
      end
    end
  end
end
