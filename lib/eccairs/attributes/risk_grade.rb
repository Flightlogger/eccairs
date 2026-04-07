# frozen_string_literal: true

module Eccairs
  module Attributes
    class RiskGrade < Eccairs::Base::EnumAttribute
      enums_from :risk_grade
    end
  end
end
