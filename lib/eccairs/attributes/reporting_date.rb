# frozen_string_literal: true

module Eccairs
  module Attributes
    class ReportingDate < Eccairs::Base::StringAttribute
      attribute_id 801
      xml_tag "Reporting_Date"
      sequence 5
    end
  end
end
