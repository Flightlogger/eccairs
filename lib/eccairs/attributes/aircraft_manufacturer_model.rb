# frozen_string_literal: true

module Eccairs
  module Attributes
    class AircraftManufacturerModel < Eccairs::Base::EnumAttribute
      enums_from :manufacturer_model_21
    end
  end
end
