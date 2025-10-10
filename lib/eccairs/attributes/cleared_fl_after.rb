# frozen_string_literal: true

module Eccairs
  module Attributes
    class ClearedFlAfter < Eccairs::Base::DecimalAttribute
      attribute_id 817
      xml_tag "Cleared_FL_After"
      sequence 54
      min(-999999)
      max 999999
    end
  end
end
