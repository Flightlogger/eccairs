# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Sector
          module Attributes
            class ServicesProvided < Eccairs::BaseEntity
              attribute_id 527
              xml_tag "Services_Provided"
              sequence 1
              validates_inclusion within: [2000000, 1000000, 1020000, 1020200, 1020100, 1010000, 1010100, 1010104, 1010103, 1010102, 1010101, 1010200, 1010204, 1010203, 1010202, 1010201, 1010300, 1010305, 1010303, 1010302, 1010301, 1010304, 1010400, 1010404, 1010403, 1010402, 1010401, 1050000, 1060000, 1040000, 1030000, 1030300, 1030100, 1030400, 1030200, 1070000, 5000000, 4000000, 3000000]
            end
          end
        end
      end
    end
  end
end
