# frozen_string_literal: true

module Eccairs
  module Attributes
    class ExperienceAllAC < Eccairs::Base::DecimalAttribute
      attribute_id 410
      xml_tag "Experience_All_A_C"
      sequence 3
      unit "Hour(s)"
      min(-999999)
      max 999999
    end
  end
end
