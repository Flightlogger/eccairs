# frozen_string_literal: true

module Eccairs
  module Attributes
    class ExportControl < Eccairs::Base::EnumAttribute
      attribute_id 1086
      xml_tag "Export_Control"
      sequence 17
      allowed_values [1, 2]
    end
  end
end
