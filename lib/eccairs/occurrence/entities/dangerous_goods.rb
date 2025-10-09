# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module DangerousGoods
        extend Eccairs::BaseEntityModule

        entity_id "43"
        xml_tag "Dangerous_Goods"
        requires_id
      end
    end
  end
end
