# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class BirdSize < Eccairs::Base::EnumEntity
            attribute_id 648
            xml_tag "Bird_Size"
            sequence 51
            allowed_values [1, 2, 3, 4]
          end
        end
      end
    end
  end
end
