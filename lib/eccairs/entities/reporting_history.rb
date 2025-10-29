# frozen_string_literal: true

module Eccairs
  module Entities
    class ReportingHistory < Eccairs::Base::Entity
      entity_id "53"
      xml_tag "Reporting_History"
      sequence 12
      # Attributes - there are many, adding the main ones

      # Add conclusions
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::Conclusions] The created attribute instance
      # @note Attribute ID: 1070, XML Tag: Conclusions
      def add_conclusions(value)
        add_attribute(Eccairs::Attributes::Conclusions, false, value)
      end

      # Add corrective actions
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::CorrectiveActions] The created attribute instance
      # @note Attribute ID: 1069, XML Tag: Corrective_Actions
      def add_corrective_actions(value)
        add_attribute(Eccairs::Attributes::CorrectiveActions, false, value)
      end

      # Add description investigation
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::DescriptionInvestigation] The created attribute instance
      # @note Attribute ID: 1067, XML Tag: Description_Investigation
      def add_description_investigation(value)
        add_attribute(Eccairs::Attributes::DescriptionInvestigation, false, value)
      end

      # Add report identification
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ReportIdentification] The created attribute instance
      # @note Attribute ID: 438, XML Tag: Report_Identification
      def add_report_identification(value)
        add_attribute(Eccairs::Attributes::ReportIdentification, false, value)
      end

      # Add report source
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ReportSource] The created attribute instance
      # @note Attribute ID: 476, XML Tag: Report_Source
      def add_report_source(value)
        add_attribute(Eccairs::Attributes::ReportSource, false, value)
      end

      # Add report status
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ReportStatus] The created attribute instance
      # @note Attribute ID: 800, XML Tag: Report_Status
      def add_report_status(value)
        add_attribute(Eccairs::Attributes::ReportStatus, false, value)
      end

      # Add reporting date
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::ReportingDate] The created attribute instance
      # @note Attribute ID: 801, XML Tag: Reporting_Date
      def add_reporting_date(value)
        add_attribute(Eccairs::Attributes::ReportingDate, false, value)
      end

      # Add reporting entity
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ReportingEntity] The created attribute instance
      # @note Attribute ID: 447, XML Tag: Reporting_Entity
      def add_reporting_entity(value)
        add_attribute(Eccairs::Attributes::ReportingEntity, false, value)
      end

      # Add reporting description
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ReporterSDescription] The created attribute instance
      # @note Attribute ID: 1092, XML Tag: Reporter_s_Description
      def add_reporting_description(value)
        add_attribute(Eccairs::Attributes::ReporterSDescription, false, value)
      end
    end
  end
end
