# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class WindGusts < Eccairs::Base::EnumEntity
        attribute_id 321
        xml_tag "Wind_Gusts"
        sequence 11
        allowed_values(
          YES: 1,
          NO: 2,
          UNKNOWN: 99
        )
      end
    end
  end
end
