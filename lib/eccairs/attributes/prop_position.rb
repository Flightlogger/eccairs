# frozen_string_literal: true

module Eccairs
  module Attributes
    class PropPosition < Eccairs::Base::IntegerAttribute
      attribute_id 895
      xml_tag "Prop_Position"
      sequence 4
      min 0
      max 999999
    end
  end
end
