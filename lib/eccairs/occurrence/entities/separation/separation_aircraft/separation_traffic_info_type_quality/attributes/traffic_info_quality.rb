# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module SeparationAircraft
          module SeparationTrafficInfoTypeQuality
            module Attributes
              class TrafficInfoQuality < Eccairs::BaseEntity
                attribute_id 595
                xml_tag "Traffic_Info_Quality"
                sequence 0
                validates_inclusion within: [97, 1, 2, 4, 3, 99]
              end
            end
          end
        end
      end
    end
  end
end
