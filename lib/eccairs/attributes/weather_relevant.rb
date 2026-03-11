# frozen_string_literal: true

module Eccairs
  module Attributes
    class WeatherRelevant < Eccairs::Base::EnumAttribute
      enums_from :weather_relevant
    end
  end
end
