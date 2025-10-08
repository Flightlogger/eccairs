# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class WxConditions < BaseEntity
        attribute_id 127

        # Wx_Conditions attribute (ID: 127)
        # - Type: Enumeration (VL127_5_0_1_1)
        # - Allowed values: "1", "2", "99"
        # Validation constants from schema
        ALLOWED_VALUES = ["1", "2", "99"].freeze

        # Common constants for readability
        VMC = "1"  # Visual Meteorological Conditions
        IMC = "2"  # Instrument Meteorological Conditions
        UNKNOWN = "99"

        def build_xml(xml)
          xml.Wx_Conditions(value, attributeId: self.class.attribute_id) if value
        end

        protected

        def validate_value(val)
          validate_enum!(:wx_conditions, val, allowed_values: ALLOWED_VALUES)
        end
      end
    end
  end
end
