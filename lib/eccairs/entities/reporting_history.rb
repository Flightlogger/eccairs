# frozen_string_literal: true

module Eccairs
  module Entities
    class ReportingHistory < Eccairs::Base::Entity
      entity_id "53"
      xml_tag "Reporting_History"

      belongs_to :occurrence

      # Attributes - there are many, adding the main ones
      has_many :conclusions, class_name: "Eccairs::Attributes::Conclusions"
      has_many :corrective_actions, class_name: "Eccairs::Attributes::CorrectiveActions"
      has_many :description_investigation, class_name: "Eccairs::Attributes::DescriptionInvestigation"
      has_many :report_identification, class_name: "Eccairs::Attributes::ReportIdentification"
      has_many :report_source, class_name: "Eccairs::Attributes::ReportSource"
      has_many :report_status, class_name: "Eccairs::Attributes::ReportStatus"
      has_many :reporting_date, class_name: "Eccairs::Attributes::ReportingDate"
      has_many :reporting_entity, class_name: "Eccairs::Attributes::ReportingEntity"
    end
  end
end
