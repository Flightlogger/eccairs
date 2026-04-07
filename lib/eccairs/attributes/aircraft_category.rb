# frozen_string_literal: true

module Eccairs
  module Attributes
    class AircraftCategory < Eccairs::Base::EnumAttribute
      enums_from :aircraft_category
    end
  end
end
