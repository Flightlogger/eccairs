# frozen_string_literal: true

module Eccairs
  module Attributes
    class RiskClassification < Eccairs::Base::StringAttribute
      attribute_id 1065
      xml_tag "Risk_Classification"
      sequence 8
    end
  end
end
