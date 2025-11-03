# frozen_string_literal: true

module Eccairs
  module Entities
    class PartInformation < Eccairs::Base::Entity
      entity_id "26"
      xml_tag "Part_Information"
      sequence 5

      # Add ata chapter number
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AtaChapterNumber] The created attribute instance
      # @note Attribute ID: 659, XML Tag: ATA_Chapter_Number
      def add_ata_chapter_number(value)
        add_attribute(Eccairs::Attributes::AtaChapterNumber, false, value)
      end

      # Add cycles since insp
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::CyclesSinceInsp] The created attribute instance
      # @note Attribute ID: 904, XML Tag: Cycles_Since_Insp
      def add_cycles_since_insp(value)
        add_attribute(Eccairs::Attributes::CyclesSinceInsp, false, value)
      end

      # Add cycles since new
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::CyclesSinceNew] The created attribute instance
      # @note Attribute ID: 902, XML Tag: Cycles_Since_New
      def add_cycles_since_new(value)
        add_attribute(Eccairs::Attributes::CyclesSinceNew, false, value)
      end

      # Add cycles since overhaul
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::CyclesSinceOverhaul] The created attribute instance
      # @note Attribute ID: 664, XML Tag: Cycles_Since_Overhaul
      def add_cycles_since_overhaul(value)
        add_attribute(Eccairs::Attributes::CyclesSinceOverhaul, false, value)
      end

      # Add date of manufacturing
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::DateOfManufacturing] The created attribute instance
      # @note Attribute ID: 905, XML Tag: Date_Of_Manufacturing
      def add_date_of_manufacturing(value)
        add_attribute(Eccairs::Attributes::DateOfManufacturing, false, value)
      end

      # Add date of overhaul
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::DateOfOverhaul] The created attribute instance
      # @note Attribute ID: 906, XML Tag: Date_Of_Overhaul
      def add_date_of_overhaul(value)
        add_attribute(Eccairs::Attributes::DateOfOverhaul, false, value)
      end

      # Add date repair insp
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::DateRepairInsp] The created attribute instance
      # @note Attribute ID: 907, XML Tag: Date_Repair_Insp
      def add_date_repair_insp(value)
        add_attribute(Eccairs::Attributes::DateRepairInsp, false, value)
      end

      # Add life controlled part
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LifeControlledPart] The created attribute instance
      # @note Attribute ID: 1114, XML Tag: Life_Controlled_Part
      def add_life_controlled_part(value)
        add_attribute(Eccairs::Attributes::LifeControlledPart, false, value)
      end

      # Add manufacturer
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::Manufacturer] The created attribute instance
      # @note Attribute ID: 658, XML Tag: Manufacturer
      def add_manufacturer(value)
        add_attribute(Eccairs::Attributes::Manufacturer, false, value)
      end

      # Add part name
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PartName] The created attribute instance
      # @note Attribute ID: 485, XML Tag: Part_Name
      def add_part_name(value)
        add_attribute(Eccairs::Attributes::PartName, false, value)
      end

      # Add part number
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PartNumber] The created attribute instance
      # @note Attribute ID: 486, XML Tag: Part_Number
      def add_part_number(value)
        add_attribute(Eccairs::Attributes::PartNumber, false, value)
      end

      # Add part serial number
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PartSerialNumber] The created attribute instance
      # @note Attribute ID: 657, XML Tag: Serial_Number
      def add_part_serial_number(value)
        add_attribute(Eccairs::Attributes::PartSerialNumber, false, value)
      end

      # Add time since inspection
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::TimeSinceInspection] The created attribute instance
      # @note Attribute ID: 901, XML Tag: Time_Since_Inspection
      def add_time_since_inspection(value)
        add_attribute(Eccairs::Attributes::TimeSinceInspection, false, value)
      end

      # Add part information time since inspection
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::PartInformationTimeSinceInspection] The created attribute instance
      # @note Attribute ID: 662, XML Tag: Time_Since_Inspection
      def add_part_information_time_since_inspection(value)
        add_attribute(Eccairs::Attributes::PartInformationTimeSinceInspection, false, value)
      end

      # Add time since new
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::TimeSinceNew] The created attribute instance
      # @note Attribute ID: 899, XML Tag: Time_Since_New
      def add_time_since_new(value)
        add_attribute(Eccairs::Attributes::TimeSinceNew, false, value)
      end

      # Add time since overhaul
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::TimeSinceOverhaul] The created attribute instance
      # @note Attribute ID: 900, XML Tag: Time_Since_Overhaul
      def add_time_since_overhaul(value)
        add_attribute(Eccairs::Attributes::TimeSinceOverhaul, false, value)
      end
    end
  end
end
