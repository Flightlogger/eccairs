# frozen_string_literal: true

module Eccairs
  module Entities
    class FlightCrewMember < Eccairs::Base::Entity
      entity_id "17"
      xml_tag "Flight_Crew_Member"

      belongs_to :aircraft

      # Nested entities
      has_many :flight_crew_licenses, class_name: "Eccairs::Entities::FlightCrewLicenses"

      # Attributes
      has_many :category, class_name: "Eccairs::Attributes::Category"
      has_many :duty_last_24_hours, class_name: "Eccairs::Attributes::DutyLast24Hours"
      has_many :experience_all_a_c, class_name: "Eccairs::Attributes::ExperienceAllAC"
      has_many :experience_this_a_c, class_name: "Eccairs::Attributes::ExperienceThisAC"
      has_many :rest_before_duty, class_name: "Eccairs::Attributes::RestBeforeDuty"
    end
  end
end
