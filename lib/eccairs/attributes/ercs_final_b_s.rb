# frozen_string_literal: true

module Eccairs
  module Attributes
    class ErcsFinalBS < Eccairs::Base::IntegerAttribute
      attribute_id 1107
      xml_tag "ERCS_Final_B_S"
      sequence 17
      min 0
      max 999999
    end
  end
end
