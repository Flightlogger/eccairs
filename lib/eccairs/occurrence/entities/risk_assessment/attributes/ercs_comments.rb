# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsComments < Eccairs::BaseEntity
            attribute_id 1110
            xml_tag "ERCS_Comments"
            sequence 19
            wrap_text_in "PlainText"
          end
        end
      end
    end
  end
end
