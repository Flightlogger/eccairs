# frozen_string_literal: true

module Eccairs
  module Entities
    class AerodromeWeatherReports < Eccairs::Base::Entity
      entity_id "2"
      xml_tag "Aerodrome_Weather_Reports"

      belongs_to :occurrence

      # Attributes
      has_many :wx_report, class_name: "Eccairs::Attributes::WxReport"
    end
  end
end

