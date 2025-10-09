# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Entities
          module SeparationAircraft
            module Entities
              module SeparationTrafficInfoTypeQuality
                module Attributes
                  class TrafficInfoQuality < Eccairs::Base::EnumEntity
                    attribute_id 595
                    xml_tag "Traffic_Info_Quality"
                    sequence 0
                    allowed_values [97, 1, 2, 4, 3, 99]
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
