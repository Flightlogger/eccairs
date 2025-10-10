# frozen_string_literal: true

module Eccairs
  module Attributes
    class RtfFrequency < Eccairs::Base::DecimalAttribute
      attribute_id 619
      xml_tag "RTF_Frequency"
      sequence 3
      unit "kHz"
      min(-999999)
      max 999999
    end
  end
end
