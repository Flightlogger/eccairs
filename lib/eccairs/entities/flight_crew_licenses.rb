# frozen_string_literal: true

module Eccairs
  module Entities
    class FlightCrewLicenses < Eccairs::Base::Entity
      entity_id "16"
      xml_tag "Flight_Crew_Licenses"
      sequence 1

      # Add validity
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::Validity] The created attribute instance
      # @note Attribute ID: 397, XML Tag: Validity
      def add_validity(value)
        add_attribute(Eccairs::Attributes::Validity, false, value)
      end

      # Add ratings
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::Ratings] The created attribute instance
      # @note Attribute ID: 398, XML Tag: Ratings
      def add_ratings(value)
        add_attribute(Eccairs::Attributes::Ratings, false, value)
      end

      # Add license issued by
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LicenseIssuedBy] The created attribute instance
      # @note Attribute ID: 399, XML Tag: License_Issued_By
      def add_license_issued_by(value)
        add_attribute(Eccairs::Attributes::LicenseIssuedBy, false, value)
      end

      # Add license type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LicenseType] The created attribute instance
      # @note Attribute ID: 400, XML Tag: License_Type
      def add_license_type(value)
        add_attribute(Eccairs::Attributes::LicenseType, false, value)
      end

      # Add date of license
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::DateOfLicense] The created attribute instance
      # @note Attribute ID: 639, XML Tag: Date_Of_License
      def add_date_of_license(value)
        add_attribute(Eccairs::Attributes::DateOfLicense, false, value)
      end
    end
  end
end
