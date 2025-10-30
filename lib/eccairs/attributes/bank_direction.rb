# frozen_string_literal: true

module Eccairs
  module Attributes
    class BankDirection < Eccairs::Base::EnumAttribute
      attribute_id 568
      xml_tag "Bank_Direction"
      sequence 0
      allowed_values [1, 2, 99]
    end
  end
end
