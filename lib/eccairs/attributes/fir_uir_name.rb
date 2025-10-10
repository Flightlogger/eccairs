# frozen_string_literal: true

module Eccairs
  module Attributes
    class FirUirName < Eccairs::Base::StringAttribute
      attribute_id 16
      xml_tag "FIR_UIR_Name"
      sequence 3 # Type 13 is a multi-select enum - validation would need the full valuelist
    end
  end
end
