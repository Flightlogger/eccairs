# frozen_string_literal: true

module Eccairs
  module Attributes
    class WxReport < Eccairs::Base::StringAttribute
      attribute_id "177"
      xml_tag "Wx_Report"
      sequence 0
      text_type true
    end
  end
end
