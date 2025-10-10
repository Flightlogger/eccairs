# frozen_string_literal: true

module Eccairs
  module Attributes
    class TimeDeviatingFl < Eccairs::Base::DecimalAttribute
      attribute_id 816
      xml_tag "Time_Deviating_FL"
      sequence 53
      unit "Second(s)"
      min(-999999)
      max 999999
    end
  end
end
