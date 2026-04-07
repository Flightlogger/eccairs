# frozen_string_literal: true

module Eccairs
  module Attributes
    class FlightPlanType < Eccairs::Base::EnumAttribute
      enums_from :flight_plan_type
    end
  end
end
