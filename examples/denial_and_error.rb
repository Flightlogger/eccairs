# frozen_string_literal: true

require 'eccairs'

report = Eccairs.report
occurrence = Eccairs::Occurrence::DewPoint.new
occurrence.dew_point = 200

report.add_occurrence(occurrence)

puts report.valid?

puts report.to_xml
