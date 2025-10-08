# frozen_string_literal: true

module Eccairs::Occurrence
  class DewPoint < BaseOccurrence
    attribute_id 85

    # Dew_Point attribute (ID: 85)
    # - Type: Decimal (Base_Dew_Point)
    # - Range: -100 to 100
    # - Unit: C (Celsius, required, fixed)
    # Validation constants from schema
    MIN_VALUE = -100
    MAX_VALUE = 100
    UNIT = "C"

    def initialize(dew_point: nil)
      super()
      self.dew_point = dew_point
    end

    def dew_point
      @dew_point
    end

    def dew_point=(value)
      validate_numeric!(:dew_point, value, min: MIN_VALUE, max: MAX_VALUE, type: :decimal)
      @dew_point = value
    end

    private

    def build_attributes(xml)
      xml.Dew_Point(@dew_point, Unit: UNIT, attributeId: self.class.attribute_id) if @dew_point
    end
  end
end
