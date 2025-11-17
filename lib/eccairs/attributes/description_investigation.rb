# frozen_string_literal: true

module Eccairs
  module Attributes
    class DescriptionInvestigation < Eccairs::Base::StringAttribute
      attribute_id 1067
      xml_tag "Description_Investigation"
      sequence 10
      text_type true
    end
  end
end
