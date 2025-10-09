# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class DangGoodsInvolved < Eccairs::Base::EnumEntity
        attribute_id 129
        xml_tag "Dang_Goods_Involved"
        sequence 2
        allowed_values(
          YES: 1,
          NO: 2,
          UNKNOWN: 99
        )
      end
    end
  end
end
