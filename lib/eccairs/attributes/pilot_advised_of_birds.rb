# frozen_string_literal: true

module Eccairs
  module Attributes
    class PilotAdvisedOfBirds < Eccairs::Base::EnumAttribute
      attribute_id 649
      xml_tag "Pilot_Advised_Of_Birds"
      sequence 52
      allowed_values [1, 2, 4]
    end
  end
end
