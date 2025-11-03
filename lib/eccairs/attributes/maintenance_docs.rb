# frozen_string_literal: true

module Eccairs
  module Attributes
    class MaintenanceDocs < Eccairs::Base::EnumAttribute
      attribute_id 174
      xml_tag "Maintenance_Docs"
      sequence 21
      allowed_values [1, 2, 98, 99]
    end
  end
end
