# frozen_string_literal: true

module Eccairs
  module Attributes
    class DescriptionInvestigation < Eccairs::Base::StringAttribute
      attribute_id 1067
      xml_tag "Description_Investigation"
      sequence 10

      def build_xml(xml)
        xml.send(self.class.xml_tag, attributeId: self.class.attribute_id) do
          xml.parent.namespace = xml.parent.namespace_definitions.find { |ns| ns.prefix == "db" }
          xml["dt"].PlainText(value)
        end
      end
    end
  end
end
