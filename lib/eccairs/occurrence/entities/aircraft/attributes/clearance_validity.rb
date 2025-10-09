# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class ClearanceValidity < Eccairs::Base::Entity
            attribute_id 57
            xml_tag "Clearance_Validity"
            sequence 8
            validates_inclusion within: [6, 2, 99, 7]
          end
        end
      end
    end
  end
end
