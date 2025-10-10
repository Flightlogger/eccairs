# frozen_string_literal: true

module Eccairs
  module Attributes
    class ReqVertSeparation < Eccairs::Base::DecimalAttribute
      attribute_id 583
      xml_tag "Req_Vert_Separation"
      sequence 6
      unit "ft"
      min(-999999)
      max 999999
    end
  end
end
