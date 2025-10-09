# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class BirdsWildlifeSeen < Eccairs::Base::EnumEntity
            attribute_id 646
            xml_tag "Birds_Wildlife_Seen"
            sequence 49
            allowed_values [1, 2, 3, 4, 5]
          end
        end
      end
    end
  end
end
