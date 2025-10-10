# frozen_string_literal: true

module Eccairs
  module Attributes
    class TotalNumberSeriousInjuries < Eccairs::Base::IntegerAttribute
      attribute_id 262
      xml_tag "Total_Number_Serious_Injuries"
      sequence 33
      min 0
      max 999999
    end
  end
end
