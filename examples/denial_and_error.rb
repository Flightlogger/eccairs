# frozen_string_literal: true

require 'eccairs'

report = Eccairs.report

# Create entities (attributes) for the occurrence
# Weather-related entities
dew_point = Eccairs::Occurrence::Attributes::DewPoint.new(15.5)
air_temperature = Eccairs::Occurrence::Attributes::AirTemperature.new(22.0)
wx_conditions = Eccairs::Occurrence::Attributes::WxConditions.new(:VMC)
wind_speed = Eccairs::Occurrence::Attributes::WindSpeed.new(12.5)
wind_direction = Eccairs::Occurrence::Attributes::WindDirection.new(270)
visibility = Eccairs::Occurrence::Attributes::Visibility.new(10000)

# Occurrence details
dang_goods_involved = Eccairs::Occurrence::Attributes::DangGoodsInvolved.new(:NO)
location_name = Eccairs::Occurrence::Attributes::LocationName.new("London Heathrow Airport")
headline = Eccairs::Occurrence::Attributes::Headline.new("Example occurrence report")

# Add entities to the report (which has a single Occurrence)
report.add_entity(dew_point)
report.add_entity(air_temperature)
report.add_entity(wx_conditions)
report.add_entity(wind_speed)
report.add_entity(wind_direction)
report.add_entity(visibility)
report.add_entity(dang_goods_involved)
report.add_entity(location_name)
report.add_entity(headline)
report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude.new(1))

puts "Validation errors:"
puts report.validate.empty? ? "None - Valid!" : report.validate

puts "\nGenerated XML:"
puts report.to_xml
