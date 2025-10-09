# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class EstVertSeparation < Eccairs::BaseEntity
            attribute_id 581
            xml_tag "Est_Vert_Separation"
            sequence 5

            def additional_xml_attributes
              { Unit: "ft" }
            end
          end
        end
      end
    end
  end
end
