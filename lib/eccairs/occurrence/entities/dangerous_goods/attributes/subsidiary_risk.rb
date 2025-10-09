# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module DangerousGoods
        module Attributes
          class SubsidiaryRisk < Eccairs::BaseEntity
            attribute_id 1055
            xml_tag "Subsidiary_Risk"
            sequence 5
            validates_inclusion within: [3, 4, 5, 6, 7, 8, 9, 10, 1, 2]
          end
        end
      end
    end
  end
end
