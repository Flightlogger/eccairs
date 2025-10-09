# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class OccOnGround < Eccairs::Base::Entity
            attribute_id 213
            xml_tag "Occ_On_Ground"
            sequence 25
            validates_inclusion within: [1, 2, 99]
          end
        end
      end
    end
  end
end
