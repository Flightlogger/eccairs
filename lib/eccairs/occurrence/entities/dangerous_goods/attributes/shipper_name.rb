# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module DangerousGoods
        module Attributes
          class ShipperName < Eccairs::Base::StringEntity
            attribute_id 1053
            xml_tag "Shipper_Name"
            sequence 3
          end
        end
      end
    end
  end
end
