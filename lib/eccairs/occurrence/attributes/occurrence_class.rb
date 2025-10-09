# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class OccurrenceClass < Eccairs::Base::EnumEntity
        attribute_id 431
        xml_tag "Occurrence_Class"
        sequence 15
        allowed_values(
          VALUE_100: 100,
          VALUE_200: 200,
          VALUE_300: 300,
          VALUE_301: 301,
          VALUE_302: 302,
          VALUE_400: 400,
          VALUE_501: 501,
          VALUE_502: 502,
          VALUE_500: 500
        )
      end
    end
  end
end
