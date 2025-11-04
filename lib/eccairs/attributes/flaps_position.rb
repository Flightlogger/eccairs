# frozen_string_literal: true

module Eccairs
  module Attributes
    class FlapsPosition < Eccairs::Base::DecimalAttribute
      attribute_id 808
      xml_tag "Flaps_Position"
      sequence 57
      unit "Degree(s)"
      min(-10)
      max 90
    end
  end
end
