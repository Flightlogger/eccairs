# frozen_string_literal: true

module Eccairs
  module Entities
    class Engine < Eccairs::Base::Entity
      entity_id "13"
      xml_tag "Engine"

      belongs_to :aircraft

      # Engine attributes
      has_many :ata_chapter_involved, class_name: "Eccairs::Attributes::AtaChapterInvolved"
      has_many :cycles_since_insp, class_name: "Eccairs::Attributes::CyclesSinceInsp"
      has_many :cycles_since_new, class_name: "Eccairs::Attributes::CyclesSinceNew"
      has_many :cycles_since_overhaul, class_name: "Eccairs::Attributes::CyclesSinceOverhaul"
      has_many :date_of_inspection, class_name: "Eccairs::Attributes::DateOfInspection"
      has_many :date_of_manufacturing, class_name: "Eccairs::Attributes::DateOfManufacturing"
      has_many :date_overhaul, class_name: "Eccairs::Attributes::DateOverhaul"
      has_many :engine_position, class_name: "Eccairs::Attributes::EnginePosition"
      has_many :engine_serial_number, class_name: "Eccairs::Attributes::EngineSerialNumber"
      has_many :hazard_eng_effect, class_name: "Eccairs::Attributes::HazardEngEffect"
      has_many :manufacturer_model, class_name: "Eccairs::Attributes::ManufacturerModel"
      has_many :nature_of_engine_involvement, class_name: "Eccairs::Attributes::NatureOfEngineInvolvement"
      has_many :time_since_inspection, class_name: "Eccairs::Attributes::TimeSinceInspection"
      has_many :time_since_new, class_name: "Eccairs::Attributes::TimeSinceNew"
      has_many :time_since_overhaul, class_name: "Eccairs::Attributes::TimeSinceOverhaul"
    end
  end
end
