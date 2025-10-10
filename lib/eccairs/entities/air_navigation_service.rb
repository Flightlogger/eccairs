# frozen_string_literal: true

module Eccairs
  module Entities
    class AirNavigationService < Eccairs::Base::Entity
      entity_id "10"
      xml_tag "Air_Navigation_Service"

      belongs_to :occurrence

      # Attributes
      has_many :ansp_name, class_name: "Eccairs::Attributes::AnspName"
      has_many :apw_alerting, class_name: "Eccairs::Attributes::ApwAlerting"
      has_many :msaw_current_alerting, class_name: "Eccairs::Attributes::MsawCurrentAlerting"
      has_many :rimcas_alerting, class_name: "Eccairs::Attributes::RimcasAlerting"
      has_many :stca_current_alerting, class_name: "Eccairs::Attributes::StcaCurrentAlerting"

      # Nested entities
      has_many :sector, class_name: "Eccairs::Entities::Sector"
    end
  end
end
