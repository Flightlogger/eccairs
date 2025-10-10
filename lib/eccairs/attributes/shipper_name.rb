# frozen_string_literal: true

module Eccairs
  module Attributes
    class ShipperName < Eccairs::Base::StringAttribute
      attribute_id 1053
      xml_tag "Shipper_Name"
      sequence 3
    end
  end
end
