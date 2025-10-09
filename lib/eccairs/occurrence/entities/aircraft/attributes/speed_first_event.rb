# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class SpeedFirstEvent < Eccairs::Base::Entity
            attribute_id 273
            xml_tag "Speed_First_Event"
            sequence 35
            unit "kt"

            validates_numericality min: -999999, max: 999999, type: :decimal
          end
        end
      end
    end
  end
end
