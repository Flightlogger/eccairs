# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class GroundSeverityApplied < Eccairs::Base::Entity
        attribute_id 1073
        xml_tag "Ground_Severity_Applied"
        sequence 41
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          VALUE_3: 3
        }
      end
    end
  end
end
