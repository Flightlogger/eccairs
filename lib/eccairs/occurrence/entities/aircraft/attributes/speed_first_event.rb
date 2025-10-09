# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class SpeedFirstEvent < Eccairs::BaseEntity
            attribute_id 273
            xml_tag "Speed_First_Event"
            sequence 35

            protected

            def additional_xml_attributes
              { Unit: "kt" }
            end
          end
        end
      end
    end
  end
end
