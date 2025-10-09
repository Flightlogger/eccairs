# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class VisibilityRestrictions < Eccairs::Base::EnumEntity
            attribute_id 311
            xml_tag "Visib_Restrictions"
            sequence 42
            allowed_values [8, 5, 6, 1, 2, 7, 3, 4, 97, 98, 99]
          end
        end
      end
    end
  end
end
