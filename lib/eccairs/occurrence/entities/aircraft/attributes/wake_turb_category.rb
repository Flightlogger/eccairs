# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class WakeTurbCategory < Eccairs::Base::EnumEntity
            attribute_id 313
            xml_tag "Wake_Turb_Category"
            sequence 43
            allowed_values [1, 2, 3, 5, 4]
          end
        end
      end
    end
  end
end
