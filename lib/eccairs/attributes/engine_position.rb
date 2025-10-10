# frozen_string_literal: true

module Eccairs
  module Attributes
    class EnginePosition < Eccairs::Base::IntegerAttribute
      attribute_id 653
      xml_tag "Engine_Position"
      sequence 2
      min 0
      max 999999
    end
  end
end
