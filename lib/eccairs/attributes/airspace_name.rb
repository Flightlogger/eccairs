# frozen_string_literal: true

module Eccairs
  module Attributes
    class AirspaceName < Eccairs::Base::StringAttribute
      attribute_id 14
      xml_tag "Airspace_Name"
      sequence 1
    end
  end
end
