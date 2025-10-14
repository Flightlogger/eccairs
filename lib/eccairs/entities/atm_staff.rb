# frozen_string_literal: true

module Eccairs
  module Entities
    class AtmStaff < Eccairs::Base::Entity
      entity_id "9"
      xml_tag "ATM_Staff"
      sequence 1

      # Add cism offered
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::CismOffered] The created attribute instance
      # @note Attribute ID: 340, XML Tag: CISM_Offered
      def add_cism_offered(value)
        add_attribute(Eccairs::Attributes::CismOffered, false, value)
      end

      # Add duty time in position
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::DutyTimeInPosition] The created attribute instance
      # @note Attribute ID: 347, XML Tag: Duty_Time_In_Position
      def add_duty_time_in_position(value)
        add_attribute(Eccairs::Attributes::DutyTimeInPosition, false, value)
      end

      # Add category
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AtmStaffCategory] The created attribute instance
      # @note Attribute ID: 357, XML Tag: Category
      def add_category(value)
        add_attribute(Eccairs::Attributes::AtmStaffCategory, false, value)
      end
    end
  end
end
