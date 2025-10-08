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

        def initialize(wx_conditions: nil)
          self.wx_conditions = wx_conditions
        end

        def wx_conditions
          @wx_conditions
        end

        def wx_conditions=(value)
          validate_enum!(:wx_conditions, value, allowed_values: ALLOWED_VALUES)
          @wx_conditions = value
        end

        def build_xml(xml)
          xml.Wx_Conditions(@wx_conditions, attributeId: self.class.attribute_id) if @wx_conditions
        end
      end
    end
  end
end

