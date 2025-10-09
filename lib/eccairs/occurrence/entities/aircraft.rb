# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        extend Eccairs::Base::EntityModule

        entity_id "4"
        xml_tag "Aircraft"
        requires_id
      end
    end
  end
end
