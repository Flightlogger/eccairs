# frozen_string_literal: true

module Eccairs
  module Attributes
    class ExperienceThisAC < Eccairs::Base::DecimalAttribute
      attribute_id 411
      xml_tag "Experience_This_A_C"
      sequence 4
      unit "Hour(s)"
      min(-999999)
      max 999999
    end
  end
end
