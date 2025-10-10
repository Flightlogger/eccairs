# frozen_string_literal: true

module Eccairs
  module Entities
    class AerodromeWeatherReports < Eccairs::Base::Entity
      entity_id "2"
      xml_tag "Aerodrome_Weather_Reports"

      # Add wx report
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::WxReport] The created attribute instance
      # @note Attribute ID: 177, XML Tag: Wx_Report
      def add_wx_report(value)
        add_attribute(Eccairs::Attributes::WxReport, false, value)
      end
    end
  end
end
