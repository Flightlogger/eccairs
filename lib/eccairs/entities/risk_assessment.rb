# frozen_string_literal: true

module Eccairs
  module Entities
    class RiskAssessment < Eccairs::Base::Entity
      entity_id "59"
      xml_tag "Risk_Assessment"

      belongs_to :occurrence

      # Attributes - there are many, adding the main ones
      has_many :key_risk_area, class_name: "Eccairs::Attributes::KeyRiskArea"
      has_many :risk_grade, class_name: "Eccairs::Attributes::RiskGrade"
      has_many :risk_level, class_name: "Eccairs::Attributes::RiskLevel"
      has_many :risk_method, class_name: "Eccairs::Attributes::RiskMethod"
    end
  end
end
