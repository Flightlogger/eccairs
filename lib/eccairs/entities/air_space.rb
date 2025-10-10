# frozen_string_literal: true

module Eccairs
  module Entities
    class AirSpace < Eccairs::Base::Entity
      entity_id "3"
      xml_tag "Air_Space"
      requires_id

      belongs_to :occurrence

      # Attributes
      has_many :airspace_class, class_name: "Eccairs::Attributes::AirspaceClass"
      has_many :airspace_name, class_name: "Eccairs::Attributes::AirspaceName"
      has_many :airspace_type, class_name: "Eccairs::Attributes::AirspaceType"
      has_many :fir_uir_name, class_name: "Eccairs::Attributes::FirUirName"
      has_many :special_activities, class_name: "Eccairs::Attributes::SpecialActivities"
    end
  end
end

