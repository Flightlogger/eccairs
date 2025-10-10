# frozen_string_literal: true

module Eccairs
  module Attributes
    class LocationIndicator < Eccairs::Base::StringAttribute
      attribute_id 5
      xml_tag "Location_Indicator"
      sequence 4
    end
  end
end
