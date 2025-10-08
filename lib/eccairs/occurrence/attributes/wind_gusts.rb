# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class WindGusts < Eccairs::BaseEntity
        attribute_id 321
        xml_tag "Wind_Gusts"
        sequence 11
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          UNKNOWN: 99
        }
      end
    end
  end
end
