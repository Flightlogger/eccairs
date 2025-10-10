# frozen_string_literal: true

module Eccairs
  module Attributes
    class ReporterSLanguage < Eccairs::Base::EnumAttribute
      attribute_id 1091
      xml_tag "Reporter_S_Language"
      sequence 18
      allowed_values (1..66).to_a
    end
  end
end
