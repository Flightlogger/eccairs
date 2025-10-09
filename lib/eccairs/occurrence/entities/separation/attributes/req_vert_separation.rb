# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class ReqVertSeparation < Eccairs::BaseEntity
            attribute_id 583
            xml_tag "Req_Vert_Separation"
            sequence 6

            def additional_xml_attributes
              { Unit: "ft" }
            end
          end
        end
      end
    end
  end
end
