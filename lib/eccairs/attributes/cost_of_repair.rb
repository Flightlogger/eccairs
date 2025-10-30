# frozen_string_literal: true

module Eccairs
  module Attributes
    class CostOfRepair < Eccairs::Base::DecimalAttribute
      attribute_id 651
      xml_tag "Cost_Of_Repair"
      sequence 0
      unit "EUR"
      min(0)
      max 999999999
    end
  end
end
