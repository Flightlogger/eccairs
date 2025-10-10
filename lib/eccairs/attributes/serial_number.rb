# frozen_string_literal: true

module Eccairs
  module Attributes
    class SerialNumber < Eccairs::Base::StringAttribute
      attribute_id 254
      xml_tag "Serial_Number"
      sequence 2
    end
  end
end
