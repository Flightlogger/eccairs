# frozen_string_literal: true

module Eccairs
  module Attributes
    class IcaoInformation < Eccairs::Base::StringAttribute
      attribute_id 28
      xml_tag "ICAO_Information"
      sequence 0
    end
  end
end
