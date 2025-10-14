# frozen_string_literal: true

module Eccairs
  module Entities
    class RiskAssessment < Eccairs::Base::Entity
      entity_id "59"
      xml_tag "Risk_Assessment"
      sequence 13
      # Attributes - there are many, adding the main ones

      # Add key risk area
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::KeyRiskArea] The created attribute instance
      # @note Attribute ID: 1097, XML Tag: Key_Risk_Area
      def add_key_risk_area(value)
        add_attribute(Eccairs::Attributes::KeyRiskArea, false, value)
      end

      # Add risk grade
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RiskGrade] The created attribute instance
      # @note Attribute ID: 718, XML Tag: Risk_Grade
      def add_risk_grade(value)
        add_attribute(Eccairs::Attributes::RiskGrade, false, value)
      end

      # Add risk level
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RiskLevel] The created attribute instance
      # @note Attribute ID: 940, XML Tag: Risk_Level
      def add_risk_level(value)
        add_attribute(Eccairs::Attributes::RiskLevel, false, value)
      end

      # Add risk method
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RiskMethod] The created attribute instance
      # @note Attribute ID: 939, XML Tag: Risk_Method
      def add_risk_method(value)
        add_attribute(Eccairs::Attributes::RiskMethod, false, value)
      end
    end
  end
end
