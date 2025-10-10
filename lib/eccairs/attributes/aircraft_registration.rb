# frozen_string_literal: true

module Eccairs
  module Attributes
    class AircraftRegistration < Eccairs::Base::StringAttribute
      attribute_id 244
      xml_tag "Aircraft_Registration"
      sequence 30
    end
  end
end
