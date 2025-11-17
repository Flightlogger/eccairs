# frozen_string_literal: true

require "nokogiri"

module Eccairs
  class Set
    SET_ATTRS = {
      "xmlns" => "http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataBridge.xsd",
      "xmlns:dt" => "http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd",
      "TaxonomyName" => "ECCAIRS Aviation",
      "TaxonomyVersion" => "5.1.0.0",
      "Domain" => "RIT",
      "Version" => "1.0.0.0"
    }.freeze

    SCHEMA_PATH = File.expand_path("../../docs/Eccairs Aviation v5100 RITedb/schema/Schema.xsd", __dir__)

    attr_reader :occurrences

    def initialize
      @occurrences = []
      @entity_id_counters = Hash.new(0)
    end

    def to_xml
      builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
        xml.SET(SET_ATTRS) do
          @occurrences.each do |occurrence|
            occurrence.build_xml(xml, @entity_id_counters)
          end
        end
      end

      builder.to_xml
    end

    # Builder pattern method for adding occurrences
    def add_occurrence(&block)
      occurrence = Eccairs::Entities::Occurrence.new
      @occurrences << occurrence
      block.call(occurrence) if block_given?
      occurrence
    end

    def valid?
      validate.empty? && validation_errors.empty?
    end

    def validate
      xml_doc = Nokogiri::XML(to_xml)
      xsd = load_schema
      xsd.validate(xml_doc)
    end

    # Get all validation errors from all occurrences
    def validation_errors
      errors = []
      @occurrences.each do |occurrence|
        errors.concat(occurrence.validation_errors) if occurrence.respond_to?(:validation_errors)
      end
      errors
    end

    # Get a summary of validation errors grouped by field
    def validation_summary
      validation_errors.group_by(&:field_name).transform_values do |errors|
        errors.map { |e| {value: e.provided_value, message: e.message} }
      end
    end

    # Get list of invalid field names
    def invalid_fields
      validation_errors.map(&:field_name).uniq
    end

    private

    def load_schema
      schema_dir = File.dirname(SCHEMA_PATH)

      # Load the schema with the proper directory context
      # Change to schema directory so relative includes work
      Dir.chdir(schema_dir) do
        # Read the file and handle BOM
        schema_content = File.read(SCHEMA_PATH, encoding: "BOM|UTF-8")
        Nokogiri::XML::Schema(schema_content)
      end
    rescue Nokogiri::XML::SyntaxError => e
      raise "Failed to load XSD schema: #{e.message}"
    end
  end
end
