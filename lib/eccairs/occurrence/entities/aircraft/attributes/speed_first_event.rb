# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class SpeedFirstEvent < Eccairs::Base::DecimalEntity
            attribute_id 273
            xml_tag "Speed_First_Event"
            sequence 35
            unit "kt"

            min(-999999)

            max 999999
          end
        end
      end
    end
  end
end
