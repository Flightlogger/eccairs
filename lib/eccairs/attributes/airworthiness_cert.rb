# frozen_string_literal: true

module Eccairs
  module Attributes
    class AirworthinessCert < Eccairs::Base::EnumAttribute
      attribute_id 35
      xml_tag "Airworthiness_Cert"
      sequence 5
      allowed_values [1, 2, 98, 99, 100]
    end
  end
end
