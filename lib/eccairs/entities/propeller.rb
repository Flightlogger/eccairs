# frozen_string_literal: true

module Eccairs
  module Entities
    class Propeller < Eccairs::Base::Entity
      entity_id "29"
      xml_tag "Propeller"

      belongs_to :aircraft

      # Attributes
      has_many :ata_chapter_involved, class_name: "Eccairs::Attributes::AtaChapterInvolved"
      has_many :cycles_since_insp, class_name: "Eccairs::Attributes::CyclesSinceInsp"
      has_many :cycles_since_new, class_name: "Eccairs::Attributes::CyclesSinceNew"
      has_many :cycles_since_overh, class_name: "Eccairs::Attributes::CyclesSinceOverh"
      has_many :date_of_manufacturing, class_name: "Eccairs::Attributes::DateOfManufacturing"
      has_many :date_of_overhaul, class_name: "Eccairs::Attributes::DateOfOverhaul"
      has_many :date_repair_insp, class_name: "Eccairs::Attributes::DateRepairInsp"
      has_many :hazardous_prop_effects, class_name: "Eccairs::Attributes::HazardousPropEffects"
      has_many :make_of_propeller, class_name: "Eccairs::Attributes::MakeOfPropeller"
      has_many :prop_involvement, class_name: "Eccairs::Attributes::PropInvolvement"
      has_many :prop_position, class_name: "Eccairs::Attributes::PropPosition"
      has_many :prop_serial, class_name: "Eccairs::Attributes::PropSerial"
      has_many :propeller_model, class_name: "Eccairs::Attributes::PropellerModel"
      has_many :time_since_inspection, class_name: "Eccairs::Attributes::TimeSinceInspection"
      has_many :time_since_new, class_name: "Eccairs::Attributes::TimeSinceNew"
      has_many :time_since_overhaul, class_name: "Eccairs::Attributes::TimeSinceOverhaul"
    end
  end
end
