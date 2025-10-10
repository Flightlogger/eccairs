# frozen_string_literal: true

module Eccairs
  module Attributes
    class VerticalSepRecorded < Eccairs::Base::DecimalAttribute
      attribute_id 585
      xml_tag "Vertical_Sep_Recorded"
      sequence 7
      unit "ft"
      min(-999999)
      max 999999
    end
  end
end
