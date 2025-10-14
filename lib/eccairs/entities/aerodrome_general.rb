# frozen_string_literal: true

module Eccairs
  module Entities
    class AerodromeGeneral < Eccairs::Base::Entity
      entity_id "1"
      xml_tag "Aerodrome_General"
      sequence 1
      # Aerodrome attributes

      # Add aerodrome latitude
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AerodromeLatitude] The created attribute instance
      # @note Attribute ID: 1, XML Tag: Aerodrome_Latitude
      def add_aerodrome_latitude(value)
        add_attribute(Eccairs::Attributes::AerodromeLatitude, false, value)
      end

      # Add aerodrome longitude
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AerodromeLongitude] The created attribute instance
      # @note Attribute ID: 2, XML Tag: Aerodrome_Longitude
      def add_aerodrome_longitude(value)
        add_attribute(Eccairs::Attributes::AerodromeLongitude, false, value)
      end

      # Add aerodrome status
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AerodromeStatus] The created attribute instance
      # @note Attribute ID: 7, XML Tag: Aerodrome_Status
      def add_aerodrome_status(value)
        add_attribute(Eccairs::Attributes::AerodromeStatus, false, value)
      end

      # Add aerodrome type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AerodromeType] The created attribute instance
      # @note Attribute ID: 10, XML Tag: Aerodrome_Type
      def add_aerodrome_type(value)
        add_attribute(Eccairs::Attributes::AerodromeType, false, value)
      end

      # Add area configuration
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AreaConfiguration] The created attribute instance
      # @note Attribute ID: 3, XML Tag: Area_Configuration
      def add_area_configuration(value)
        add_attribute(Eccairs::Attributes::AreaConfiguration, false, value)
      end

      # Add elevation above msl
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ElevationAboveMsl] The created attribute instance
      # @note Attribute ID: 4, XML Tag: Elevation_Above_MSL
      def add_elevation_above_msl(value)
        add_attribute(Eccairs::Attributes::ElevationAboveMsl, false, value)
      end

      # Add landing area type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LandingAreaType] The created attribute instance
      # @note Attribute ID: 9, XML Tag: Landing_Area_Type
      def add_landing_area_type(value)
        add_attribute(Eccairs::Attributes::LandingAreaType, false, value)
      end

      # Add location indicator
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LocationIndicator] The created attribute instance
      # @note Attribute ID: 5, XML Tag: Location_Indicator
      def add_location_indicator(value)
        add_attribute(Eccairs::Attributes::LocationIndicator, false, value)
      end

      # Add location on near aerodrome
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LocationOnNearAerodrome] The created attribute instance
      # @note Attribute ID: 641, XML Tag: Location_On_Near_Aerodrome
      def add_location_on_near_aerodrome(value)
        add_attribute(Eccairs::Attributes::LocationOnNearAerodrome, false, value)
      end

      # Add surface type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SurfaceType] The created attribute instance
      # @note Attribute ID: 509, XML Tag: Surface_Type
      def add_surface_type(value)
        add_attribute(Eccairs::Attributes::SurfaceType, false, value)
      end

      # Add narrative entity
      # @yield [narrative] Block for configuring the narrative
      # @yieldparam narrative [Eccairs::Entities::AerodromeNarrative] The entity instance
      # @return [Eccairs::Entities::AerodromeNarrative] The created entity instance
      # @note Entity ID: 22, XML Tag: Narrative
      def add_narrative(&block)
        add_entity(Eccairs::Entities::AerodromeNarrative, false, &block)
      end

      # Add runway entity
      # @param id [String, nil] The entity ID (optional)
      # @yield [runway] Block for configuring the runway
      # @yieldparam runway [Eccairs::Entities::Runway] The entity instance
      # @return [Eccairs::Entities::Runway] The created entity instance
      # @note Entity ID: 31, XML Tag: Runway
      def add_runway(id: nil, &block)
        add_entity(Eccairs::Entities::Runway, false, id: id, &block)
      end

      # Add vehicle entity
      # @param id [String, nil] The entity ID (optional)
      # @yield [vehicle] Block for configuring the vehicle
      # @yieldparam vehicle [Eccairs::Entities::Vehicle] The entity instance
      # @return [Eccairs::Entities::Vehicle] The created entity instance
      # @note Entity ID: 48, XML Tag: Vehicle
      def add_vehicle(id: nil, &block)
        add_entity(Eccairs::Entities::Vehicle, false, id: id, &block)
      end
    end
  end
end
