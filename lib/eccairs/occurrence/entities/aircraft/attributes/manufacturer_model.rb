# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class ManufacturerModel < Eccairs::Base::Entity
            attribute_id 21
            xml_tag "Manufacturer_Model"
            sequence 0 # Type 12 is a multi-select enum - validation would need the full valuelist
          end
        end
      end
    end
  end
end
