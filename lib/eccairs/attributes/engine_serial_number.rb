# frozen_string_literal: true

module Eccairs
  module Attributes
    class EngineSerialNumber < Eccairs::Base::StringAttribute
      attribute_id 881
      xml_tag "Engine_Serial_Number"
      sequence 4
    end
  end
end
