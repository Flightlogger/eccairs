# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class Conclusions < Eccairs::Base::Entity
            attribute_id 1070
            xml_tag "Conclusions"
            sequence 13
            wrap_text_in "PlainText"
          end
        end
      end
    end
  end
end
