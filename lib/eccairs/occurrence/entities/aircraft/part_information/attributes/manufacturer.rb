# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module PartInformation
          module Attributes
            class Manufacturer < Eccairs::BaseEntity
              attribute_id 658
              xml_tag "Manufacturer"
              sequence 3
              validates_inclusion within: (1..224).to_a
            end
          end
        end
      end
    end
  end
end
