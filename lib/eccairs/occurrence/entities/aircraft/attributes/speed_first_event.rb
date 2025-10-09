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
            validates_numericality min: -999999, max: 999999, type: :decimal

            protected

            def additional_xml_attributes
              {Unit: "kt"}
            end
          end
        end
      end
    end
  end
end
