# frozen_string_literal: true

module Eccairs
  module Attributes
    class AircraftManufacturerModel < Eccairs::Base::StringAttribute
      attribute_id 21
      xml_tag "Manufacturer_Model"
      sequence 0
    end
  end
end
