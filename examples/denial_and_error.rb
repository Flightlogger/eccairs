# frozen_string_literal: true

require 'eccairs'

report = Eccairs.report
occurrence = Eccairs::Occurrence::DewPoint.new
report.add_occurrence(occurrence)
puts report.to_xml
