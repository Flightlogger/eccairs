# frozen_string_literal: true

module Eccairs
  module Entities
    class Engine < Eccairs::Base::Entity
      entity_id "13"
      xml_tag "Engine"
      sequence 1
      # Engine attributes

      # Add ata chapter involved
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AtaChapterInvolved] The created attribute instance
      # @note Attribute ID: 894, XML Tag: ATA_Chapter_Involved
      def add_ata_chapter_involved(value)
        add_attribute(Eccairs::Attributes::AtaChapterInvolved, false, value)
      end

      # Add cycles since insp
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::EngineCyclesSinceInsp] The created attribute instance
      # @note Attribute ID: 887, XML Tag: Cycles_Since_Insp
      def add_cycles_since_insp(value)
        add_attribute(Eccairs::Attributes::EngineCyclesSinceInsp, false, value)
      end

      # Add cycles since new
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::EngineCyclesSinceNew] The created attribute instance
      # @note Attribute ID: 885, XML Tag: Cycles_Since_New
      def add_cycles_since_new(value)
        add_attribute(Eccairs::Attributes::EngineCyclesSinceNew, false, value)
      end

      # Add cycles since overhaul
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::EngineCyclesSinceOverhaul] The created attribute instance
      # @note Attribute ID: 886, XML Tag: Cycles_Since_Overhaul
      def add_cycles_since_overhaul(value)
        add_attribute(Eccairs::Attributes::EngineCyclesSinceOverhaul, false, value)
      end

      # Add date of inspection
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::DateOfInspection] The created attribute instance
      # @note Attribute ID: 890, XML Tag: Date_Of_Inspection
      def add_date_of_inspection(value)
        add_attribute(Eccairs::Attributes::DateOfInspection, false, value)
      end

      # Add date of manufacturing
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::DateOfManufacturing] The created attribute instance
      # @note Attribute ID: 905, XML Tag: Date_Of_Manufacturing
      def add_date_of_manufacturing(value)
        add_attribute(Eccairs::Attributes::DateOfManufacturing, false, value)
      end

      # Add date overhaul
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::DateOverhaul] The created attribute instance
      # @note Attribute ID: 889, XML Tag: Date_Overhaul
      def add_date_overhaul(value)
        add_attribute(Eccairs::Attributes::DateOverhaul, false, value)
      end

      # Add engine position
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::EnginePosition] The created attribute instance
      # @note Attribute ID: 653, XML Tag: Engine_Position
      def add_engine_position(value)
        add_attribute(Eccairs::Attributes::EnginePosition, false, value)
      end

      # Add engine serial number
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::EngineSerialNumber] The created attribute instance
      # @note Attribute ID: 881, XML Tag: Engine_Serial_Number
      def add_engine_serial_number(value)
        add_attribute(Eccairs::Attributes::EngineSerialNumber, false, value)
      end

      # Add hazard eng effect
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::HazardEngEffect] The created attribute instance
      # @note Attribute ID: 945, XML Tag: Hazard_Eng_Effect
      def add_hazard_eng_effect(value)
        add_attribute(Eccairs::Attributes::HazardEngEffect, false, value)
      end

      # Add manufacturer model
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ManufacturerModel] The created attribute instance
      # @note Attribute ID: 387, XML Tag: Manufacturer_Model
      def add_manufacturer_model(value)
        add_attribute(Eccairs::Attributes::ManufacturerModel, false, value)
      end

      # Add nature of engine involvement
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::NatureOfEngineInvolvement] The created attribute instance
      # @note Attribute ID: 654, XML Tag: Nature_Of_Engine_Involvement
      def add_nature_of_engine_involvement(value)
        add_attribute(Eccairs::Attributes::NatureOfEngineInvolvement, false, value)
      end

      # Add time since inspection
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::TimeSinceInspection] The created attribute instance
      # @note Attribute ID: 901, XML Tag: Time_Since_Inspection
      def add_time_since_inspection(value)
        add_attribute(Eccairs::Attributes::TimeSinceInspection, false, value)
      end

      # Add time since new
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::EngineTimeSinceNew] The created attribute instance
      # @note Attribute ID: 883, XML Tag: Time_Since_New
      def add_time_since_new(value)
        add_attribute(Eccairs::Attributes::EngineTimeSinceNew, false, value)
      end

      # Add time since overhaul
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::EngineTimeSinceOverhaul] The created attribute instance
      # @note Attribute ID: 884, XML Tag: Time_Since_Overhaul
      def add_time_since_overhaul(value)
        add_attribute(Eccairs::Attributes::EngineTimeSinceOverhaul, false, value)
      end
    end
  end
end
