# frozen_string_literal: true

module Eccairs
  module Entities
    class FlightCrewLicenses < Eccairs::Base::Entity
      entity_id "16"
      xml_tag "Flight_Crew_Licenses"

      belongs_to :flight_crew_member

      # Attributes
      has_many :validity, class_name: "Eccairs::Attributes::Validity"
      has_many :ratings, class_name: "Eccairs::Attributes::Ratings"
      has_many :license_issued_by, class_name: "Eccairs::Attributes::LicenseIssuedBy"
      has_many :license_type, class_name: "Eccairs::Attributes::LicenseType"
      has_many :date_of_license, class_name: "Eccairs::Attributes::DateOfLicense"
    end
  end
end

