# frozen_string_literal: true

module Eccairs
  module Attributes
    class GhOrganisation < Eccairs::Base::EnumAttribute
      attribute_id 1116
      xml_tag "GH_Organisation"
      sequence 1
      allowed_values (1..35).to_a
    end
  end
end
