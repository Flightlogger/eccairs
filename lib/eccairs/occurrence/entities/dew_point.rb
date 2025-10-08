# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class DewPoint < BaseEntity
        attribute_id 85
        xml_tag "Dew_Point"

        # Dew_Point attribute (ID: 85)
        # - Type: Decimal (Base_Dew_Point)
        # - Range: -100 to 100
        # - Unit: C (Celsius, required, fixed)
        # Validation constants from schema
        MIN_VALUE = -100
        MAX_VALUE = 100
        UNIT = "C"

        protected

        def validate_value(val)
          validate_numeric!(:dew_point, val, min: MIN_VALUE, max: MAX_VALUE, type: :decimal)
        end

        def additional_xml_attributes
          { Unit: UNIT }
        end
      end
    end
  end
end
