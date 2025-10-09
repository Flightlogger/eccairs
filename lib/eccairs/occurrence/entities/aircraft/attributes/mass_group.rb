# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class MassGroup < Eccairs::Base::EnumEntity
            attribute_id 319
            xml_tag "Mass_Group"
            sequence 44
            allowed_values (99..124).to_a
          end
        end
      end
    end
  end
end
