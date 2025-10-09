# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class PilotAdvisedOfBirds < Eccairs::Base::EnumEntity
            attribute_id 649
            xml_tag "Pilot_Advised_Of_Birds"
            sequence 52
            allowed_values [1, 2, 4]
          end
        end
      end
    end
  end
end
