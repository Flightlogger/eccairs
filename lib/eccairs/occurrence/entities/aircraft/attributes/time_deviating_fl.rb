# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TimeDeviatingFl < Eccairs::Base::Entity
            attribute_id 816
            xml_tag "Time_Deviating_FL"
            sequence 53
            validates_numericality min: -999999, max: 999999, type: :decimal

            protected

            def additional_xml_attributes
              {Unit: "Second(s)"}
            end
          end
        end
      end
    end
  end
end
