# frozen_string_literal: true

module Eccairs
  module Entities
    class Sector < Eccairs::Base::Entity
      entity_id "33"
      xml_tag "Sector"
      requires_id

      belongs_to :air_navigation_service

      # Sector attributes
      has_many :sector_name, class_name: "Eccairs::Attributes::SectorName"
      has_many :services_provided, class_name: "Eccairs::Attributes::ServicesProvided"
    end
  end
end
