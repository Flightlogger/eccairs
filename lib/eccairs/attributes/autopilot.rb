# frozen_string_literal: true

module Eccairs
  module Attributes
    class Autopilot < Eccairs::Base::EnumAttribute
      attribute_id 804
      xml_tag "Autopilot"
      sequence 56
      allowed_values [1, 2, 3]
    end
  end
end
