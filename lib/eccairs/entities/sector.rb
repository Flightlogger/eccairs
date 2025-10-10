# frozen_string_literal: true

module Eccairs
  module Entities
    class Sector < Eccairs::Base::Entity
      entity_id "33"
      xml_tag "Sector"
      requires_id

      # Add atm staff entity
      # @yield [atm_staff] Block for configuring the atm staff
      # @yieldparam atm_staff [Eccairs::Entities::AtmStaff] The entity instance
      # @return [Eccairs::Entities::AtmStaff] The created entity instance
      # @note Entity ID: 9, XML Tag: ATM_Staff
      def add_atm_staff(&block)
        add_entity(Eccairs::Entities::AtmStaff, false, &block)
      end

      # Add sector name
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SectorName] The created attribute instance
      # @note Attribute ID: 526, XML Tag: Sector_Name
      def add_sector_name(value)
        add_attribute(Eccairs::Attributes::SectorName, false, value)
      end

      # Add services provided
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ServicesProvided] The created attribute instance
      # @note Attribute ID: 527, XML Tag: Services_Provided
      def add_services_provided(value)
        add_attribute(Eccairs::Attributes::ServicesProvided, false, value)
      end

      # Add workload controller
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::WorkloadController] The created attribute instance
      # @note Attribute ID: 559, XML Tag: Workload_Controller
      def add_workload_controller(value)
        add_attribute(Eccairs::Attributes::WorkloadController, false, value)
      end

      # Add rtf frequency
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RtfFrequency] The created attribute instance
      # @note Attribute ID: 619, XML Tag: RTF_Frequency
      def add_rtf_frequency(value)
        add_attribute(Eccairs::Attributes::RtfFrequency, false, value)
      end
    end
  end
end
