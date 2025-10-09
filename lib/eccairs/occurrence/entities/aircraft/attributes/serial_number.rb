# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class SerialNumber < Eccairs::Base::Entity
            attribute_id 254
            xml_tag "Serial_Number"
            sequence 32
          end
        end
      end
    end
  end
end
