# frozen_string_literal: true

module Eccairs::Occurrence
  class DewPoint < BaseOccurrence
    attribute_id 85

    # Dew_Point attribute (ID: 85)
    # - Type: Decimal (Base_Dew_Point)
    # - Range: -100 to 100
    # - Unit: C (Celsius, required, fixed)
    # - attributeId: 85 (fixed)
    attr_accessor :dew_point

    def initialize(dew_point: nil)
      super()
      @dew_point = dew_point
    end

    private

    def build_attributes(xml)
      xml.Dew_Point(@dew_point, Unit: "C", attributeId: self.class.attribute_id) if @dew_point
    end
  end
end
