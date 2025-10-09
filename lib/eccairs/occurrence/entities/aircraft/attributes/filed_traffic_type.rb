# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class FiledTrafficType < Eccairs::BaseEntity
            attribute_id 118
            xml_tag "Filed_Traffic_Type"
            sequence 15
            validates_inclusion within: [2, 1, 3, 99]
          end
        end
      end
    end
  end
end
