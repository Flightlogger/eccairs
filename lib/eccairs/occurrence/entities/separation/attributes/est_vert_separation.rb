# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class EstVertSeparation < Eccairs::Base::DecimalEntity
            attribute_id 581
            xml_tag "Est_Vert_Separation"
            sequence 5
            unit "ft"

            min(-999999)

            max 999999
          end
        end
      end
    end
  end
end
