# frozen_string_literal: true

module Eccairs
  module Attributes
    class WxReport < Eccairs::Base::StringAttribute
      attribute_id "177"
      xml_tag "Wx_Report"
      sequence 0

      # Override build_xml to use PlainText child element
      def build_xml(xml)
        attrs = {attributeId: self.class.attribute_id}
        attrs[:Unit] = self.class.unit if self.class.unit

        xml.public_send(self.class.xml_tag, attrs) do
          xml.parent.namespace = xml.parent.namespace_definitions.find { |ns| ns.prefix == "dt" }
          xml["dt"].PlainText(@value)
        end
      end
    end
  end
end
