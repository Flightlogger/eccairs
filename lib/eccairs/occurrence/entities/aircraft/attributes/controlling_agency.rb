# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class ControllingAgency < Eccairs::BaseEntity
            attribute_id 64
            xml_tag "Controlling_Agency"
            sequence 11
            validates_inclusion within: [1, 2, 3, 97, 98, 99]
          end
        end
      end
    end
  end
end
