# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Entities
          module Sector
            module Entities
              module AtmStaff
                module Attributes
                  class DutyTimeInPosition < Eccairs::Base::Entity
                    attribute_id 347
                    xml_tag "Duty_Time_In_Position"
                    sequence 1
                    unit "Hour(s)"

                    validates_numericality min: -999999, max: 999999, type: :decimal
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
