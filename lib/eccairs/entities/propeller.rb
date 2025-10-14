# frozen_string_literal: true

module Eccairs
  module Entities
    class Propeller < Eccairs::Base::Entity
      entity_id "29"
      xml_tag "Propeller"
      sequence 6

      # Add ata chapter involved
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AtaChapterInvolved] The created attribute instance
      # @note Attribute ID: 894, XML Tag: ATA_Chapter_Involved
      def add_ata_chapter_involved(value)
        add_attribute(Eccairs::Attributes::AtaChapterInvolved, false, value)
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

      # Add cycles since overh
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::CyclesSinceOverh] The created attribute instance
      # @note Attribute ID: 903, XML Tag: Cycles_Since_Overh
      def add_cycles_since_overh(value)
        add_attribute(Eccairs::Attributes::CyclesSinceOverh, false, value)
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

      # Add hazardous prop effects
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::HazardousPropEffects] The created attribute instance
      # @note Attribute ID: 946, XML Tag: Hazardous_Prop_Effects
      def add_hazardous_prop_effects(value)
        add_attribute(Eccairs::Attributes::HazardousPropEffects, false, value)
      end

      # Add make of propeller
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::MakeOfPropeller] The created attribute instance
      # @note Attribute ID: 492, XML Tag: Make_Of_Propeller
      def add_make_of_propeller(value)
        add_attribute(Eccairs::Attributes::MakeOfPropeller, false, value)
      end

      # Add prop involvement
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PropInvolvement] The created attribute instance
      # @note Attribute ID: 896, XML Tag: Prop_Involvement
      def add_prop_involvement(value)
        add_attribute(Eccairs::Attributes::PropInvolvement, false, value)
      end

      # Add prop position
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PropPosition] The created attribute instance
      # @note Attribute ID: 895, XML Tag: Prop_Position
      def add_prop_position(value)
        add_attribute(Eccairs::Attributes::PropPosition, false, value)
      end

      # Add prop serial
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PropSerial] The created attribute instance
      # @note Attribute ID: 893, XML Tag: Prop_Serial
      def add_prop_serial(value)
        add_attribute(Eccairs::Attributes::PropSerial, false, value)
      end

      # Add propeller model
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PropellerModel] The created attribute instance
      # @note Attribute ID: 493, XML Tag: Propeller_Model
      def add_propeller_model(value)
        add_attribute(Eccairs::Attributes::PropellerModel, false, value)
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
