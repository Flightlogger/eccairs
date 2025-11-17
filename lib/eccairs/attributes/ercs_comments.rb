# frozen_string_literal: true

module Eccairs
  module Attributes
    class ErcsComments < Eccairs::Base::StringAttribute
      attribute_id 1110
      xml_tag "ERCS_Comments"
      sequence 19
      text_type true
    end
  end
end
