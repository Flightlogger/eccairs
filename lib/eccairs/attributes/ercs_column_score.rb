# frozen_string_literal: true

module Eccairs
  module Attributes
    class ErcsColumnScore < Eccairs::Base::IntegerAttribute
      attribute_id 1094
      xml_tag "ERCS_Column_Score"
      sequence 4
      min 0
      max 999999
    end
  end
end
