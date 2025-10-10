# frozen_string_literal: true

module Eccairs
  module Attributes
    class FlightNumber < Eccairs::Base::StringAttribute
      attribute_id 120
      xml_tag "Flight_Number"
      sequence 16
    end
  end
end
