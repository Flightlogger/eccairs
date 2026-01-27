# frozen_string_literal: true

module Eccairs
  module Attributes
    class Attachments < Eccairs::Base::StringAttribute
      attribute_id 793
      xml_tag "Attachments"
      sequence 100

      # Represented as a complex value (dataTypes), not plain text content.
      dt_child "FileName" do |v|
        File.basename(v)
      end
    end
  end
end
