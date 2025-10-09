# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TurbulenceIntensity < Eccairs::Base::Entity
            attribute_id 293
            xml_tag "Turbulence_Intensity"
            sequence 40
            validates_inclusion within: [97, 1, 2, 3, 99]
          end
        end
      end
    end
  end
end
