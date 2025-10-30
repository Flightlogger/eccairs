# frozen_string_literal: true

module Eccairs
  module Attributes
    class LossOfRevenue < Eccairs::Base::DecimalAttribute
      attribute_id 652
      xml_tag "Loss_Of_Revenue"
      sequence 0
      unit "EUR"
      min(0)
      max 999999999
    end
  end
end
