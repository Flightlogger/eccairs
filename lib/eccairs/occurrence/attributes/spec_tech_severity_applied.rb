# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class SpecTechSeverityApplied < Eccairs::Base::Entity
        attribute_id 1079
        xml_tag "Spec_Tech_Severity_Applied"
        sequence 47
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          VALUE_3: 3
        }
      end
    end
  end
end
