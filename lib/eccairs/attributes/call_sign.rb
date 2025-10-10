# frozen_string_literal: true

module Eccairs
  module Attributes
    class CallSign < Eccairs::Base::StringAttribute
      attribute_id 54
      xml_tag "Call_Sign"
      sequence 7
    end
  end
end
