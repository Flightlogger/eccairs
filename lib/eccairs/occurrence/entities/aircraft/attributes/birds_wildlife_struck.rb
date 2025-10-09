# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class BirdsWildlifeStruck < Eccairs::BaseEntity
            attribute_id 647
            xml_tag "Birds_Wildlife_Struck"
            sequence 50
            validates_inclusion within: [1, 2, 3, 4, 5]
          end
        end
      end
    end
  end
end
