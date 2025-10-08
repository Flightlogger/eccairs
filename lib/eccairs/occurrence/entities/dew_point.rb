# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class DewPoint < BaseEntity
        attribute_id 85

        # Dew_Point attribute (ID: 85)
        # - Type: Decimal (Base_Dew_Point)
        # - Range: -100 to 100
        # - Unit: C (Celsius, required, fixed)
        # Validation constants from schema
        MIN_VALUE = -100
        MAX_VALUE = 100
        UNIT = "C"

        def build_xml(xml)
          xml.Dew_Point(value, Unit: UNIT, attributeId: self.class.attribute_id) if value
        end

        protected

        def validate_value(val)
          validate_numeric!(:dew_point, val, min: MIN_VALUE, max: MAX_VALUE, type: :decimal)
        end
      end
    end
  end
end
