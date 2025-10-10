# frozen_string_literal: true

module Eccairs
  module Attributes
    class ReportStatus < Eccairs::Base::EnumAttribute
      attribute_id 800
      xml_tag "Report_Status"
      sequence 4
      allowed_values [5, 2, 1, 6, 3, 8, 4, 7]
    end
  end
end
