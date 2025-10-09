# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class BirdsWildlifeSeen < Eccairs::Base::Entity
            attribute_id 646
            xml_tag "Birds_Wildlife_Seen"
            sequence 49
            validates_inclusion within: [1, 2, 3, 4, 5]
          end
        end
      end
    end
  end
end
