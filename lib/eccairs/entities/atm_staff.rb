# frozen_string_literal: true

module Eccairs
  module Entities
    class AtmStaff < Eccairs::Base::Entity
      entity_id "9"
      xml_tag "ATM_Staff"

      belongs_to :sector

      # Attributes
      has_many :cism_offered, class_name: "Eccairs::Attributes::CismOffered"
      has_many :duty_time_in_position, class_name: "Eccairs::Attributes::DutyTimeInPosition"
      has_many :category, class_name: "Eccairs::Attributes::AtmStaffCategory"
    end
  end
end
