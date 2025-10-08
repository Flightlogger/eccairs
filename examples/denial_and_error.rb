# frozen_string_literal: true

require 'eccairs'

report = Eccairs.report

# Create entities (attributes) for the occurrence
dew_point = Eccairs::Occurrence::Entities::DewPoint.new(15.5)
wx_conditions = Eccairs::Occurrence::Entities::WxConditions.new('1')

# Add entities to the report (which has a single Occurrence)
report.add_entity(dew_point)
report.add_entity(wx_conditions)

puts "Validation errors:"
puts report.validate.empty? ? "None - Valid!" : report.validate

puts "\nGenerated XML:"
puts report.to_xml
