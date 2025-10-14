# frozen_string_literal: true

module Eccairs
  module Entities
    class Incapacitation < Eccairs::Base::Entity
      entity_id "20"
      xml_tag "Incapacitation"
      sequence 3

      # Add person incapacitated
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PersonIncapacitated] The created attribute instance
      # @note Attribute ID: 418, XML Tag: Person_Incapacitated
      def add_person_incapacitated(value)
        add_attribute(Eccairs::Attributes::PersonIncapacitated, false, value)
      end

      # Add reason for incapacity
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ReasonForIncapacity] The created attribute instance
      # @note Attribute ID: 419, XML Tag: Reason_For_Incapacity
      def add_reason_for_incapacity(value)
        add_attribute(Eccairs::Attributes::ReasonForIncapacity, false, value)
      end
    end
  end
end
