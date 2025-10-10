# frozen_string_literal: true

module Eccairs
  module Attributes
    class PartSerialNumber < Eccairs::Base::StringAttribute
      attribute_id 657
      xml_tag "Serial_Number"
      sequence 2
    end
  end
end

