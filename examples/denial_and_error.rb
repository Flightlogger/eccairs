# frozen_string_literal: true

require 'eccairs'

report = Eccairs.report

# Create entities (attributes) for the occurrence
dew_point = Eccairs::Occurrence::Entities::DewPoint.new(15.5)
wx_conditions = Eccairs::Occurrence::Entities::WxConditions.new(1)
dang_goods_involved = Eccairs::Occurrence::Entities::DangGoodsInvolved.new(2)

# Add entities to the report (which has a single Occurrence)
report.add_entity(dew_point)
report.add_entity(wx_conditions)
report.add_entity(dang_goods_involved)

puts "Validation errors:"
puts report.validate.empty? ? "None - Valid!" : report.validate

puts "\nGenerated XML:"
puts report.to_xml
