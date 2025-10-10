# frozen_string_literal: true

module Eccairs
  module Entities
    class Sector < Eccairs::Base::Entity
      entity_id "33"
      xml_tag "Sector"
      requires_id

      belongs_to :air_navigation_service

      # Nested entities
      has_many :atm_staff, class_name: "Eccairs::Entities::AtmStaff"

      # Linked entities (references to entities defined elsewhere)
      # has_many :aircraft, class_name: "Eccairs::Entities::Aircraft"

      # Sector attributes
      has_many :sector_name, class_name: "Eccairs::Attributes::SectorName"
      has_many :services_provided, class_name: "Eccairs::Attributes::ServicesProvided"
      has_many :workload_controller, class_name: "Eccairs::Attributes::WorkloadController"
      has_many :rtf_frequency, class_name: "Eccairs::Attributes::RtfFrequency"
    end
  end
end
