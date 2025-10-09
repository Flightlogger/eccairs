# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class ReqVertSeparation < Eccairs::Base::Entity
            attribute_id 583
            xml_tag "Req_Vert_Separation"
            sequence 6
            unit "ft"

            validates_numericality min: -999999, max: 999999, type: :decimal
          end
        end
      end
    end
  end
end
