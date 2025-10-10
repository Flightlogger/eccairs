# frozen_string_literal: true

module Eccairs
  module Attributes
    class LicenseType < Eccairs::Base::EnumAttribute
      attribute_id 400
      xml_tag "License_Type"
      sequence 3
      allowed_values [100, 104, 102, 10000, 10001, 101, 105, 197, 198, 199, 500, 504, 502, 10002, 501, 505, 597, 598, 599, 400, 10003, 401, 405, 497, 498, 499, 200, 204, 202, 10004, 201, 205, 297, 298, 299, 300, 304, 302, 301, 305, 397, 398, 399, 600, 604, 602, 601, 605, 697, 698, 699, 9700, 9800, 9804, 9802, 9801, 9805, 9897, 9898, 9899, 9900, 9904, 9902, 9901, 9905, 9997, 9998, 9999]
    end
  end
end
