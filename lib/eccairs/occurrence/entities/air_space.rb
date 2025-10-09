# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirSpace
        extend Eccairs::BaseEntityModule

        entity_id "3"
        xml_tag "Air_Space"
        requires_id
      end
    end
  end
end
