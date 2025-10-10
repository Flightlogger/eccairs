# frozen_string_literal: true

module Eccairs
  module Attributes
    class YearBuilt < Eccairs::Base::IntegerAttribute
      attribute_id 327
      xml_tag "Year_Built"
      sequence 45
      min 0
      max 999999
    end
  end
end
