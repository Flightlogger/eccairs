# frozen_string_literal: true

module Eccairs
  module Entities
    class Incapacitation < Eccairs::Base::Entity
      entity_id "20"
      xml_tag "Incapacitation"

      belongs_to :aircraft

      # Attributes
      has_many :person_incapacitated, class_name: "Eccairs::Attributes::PersonIncapacitated"
      has_many :reason_for_incapacity, class_name: "Eccairs::Attributes::ReasonForIncapacity"
    end
  end
end
