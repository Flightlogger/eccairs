# frozen_string_literal: true

module Eccairs
  module Entities
    class PartInformation < Eccairs::Base::Entity
      entity_id "26"
      xml_tag "Part_Information"

      belongs_to :aircraft

      # Attributes
      has_many :ata_chapter_number, class_name: "Eccairs::Attributes::AtaChapterNumber"
      has_many :cycles_since_insp, class_name: "Eccairs::Attributes::CyclesSinceInsp"
      has_many :cycles_since_new, class_name: "Eccairs::Attributes::CyclesSinceNew"
      has_many :cycles_since_overhaul, class_name: "Eccairs::Attributes::CyclesSinceOverhaul"
      has_many :date_of_manufacturing, class_name: "Eccairs::Attributes::DateOfManufacturing"
      has_many :date_of_overhaul, class_name: "Eccairs::Attributes::DateOfOverhaul"
      has_many :date_repair_insp, class_name: "Eccairs::Attributes::DateRepairInsp"
      has_many :life_controlled_part, class_name: "Eccairs::Attributes::LifeControlledPart"
      has_many :manufacturer, class_name: "Eccairs::Attributes::Manufacturer"
      has_many :part_name, class_name: "Eccairs::Attributes::PartName"
      has_many :part_number, class_name: "Eccairs::Attributes::PartNumber"
      has_many :part_serial_number, class_name: "Eccairs::Attributes::PartSerialNumber"
      has_many :time_since_inspection, class_name: "Eccairs::Attributes::TimeSinceInspection"
      has_many :time_since_new, class_name: "Eccairs::Attributes::TimeSinceNew"
      has_many :time_since_overhaul, class_name: "Eccairs::Attributes::TimeSinceOverhaul"
    end
  end
end
