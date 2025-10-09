# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class ReportingFormType < Eccairs::Base::EnumEntity
            attribute_id 495
            xml_tag "Reporting_Form_Type"
            sequence 3
            allowed_values [9816, 100, 101, 102, 200, 201, 202, 300, 301, 302, 400, 401, 402, 9800, 9801, 9802, 9803, 9804, 9806, 9822, 9823, 9824, 500, 501, 502, 503, 504, 9805, 9807, 9815, 9817, 9818, 9820, 9819, 9808, 9809, 9810, 9814, 9813, 9821, 9811, 9812]
          end
        end
      end
    end
  end
end
