# frozen_string_literal: true

module Eccairs::Occurrence
  class DewPoint < BaseOccurrence
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

    def to_xml(xml)
      xml.Occurrence(entityId: "24") do
        xml.ATTRIBUTES do
          xml.Dew_Point(@dew_point, Unit: "C", attributeId: "85") if @dew_point
        end
      end
    end
  end
end
