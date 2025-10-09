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
    OCCURRENCE_ENTITY_ID = "24"

    attr_reader :entities

    def initialize
      @entities = []
      @entity_id_counters = Hash.new(0)
    end

    def to_xml
      builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
        xml.SET(SET_ATTRS) do
          xml.Occurrence(entityId: OCCURRENCE_ENTITY_ID) do
            build_hierarchical_xml(xml, @entities, "Eccairs::Occurrence")
          end
        end
      end

      builder.to_xml
    end

    def add_entity(entity)
      @entities << entity
      self
    end

    def valid?
      validate.empty?
    end

    def validate
      xml_doc = Nokogiri::XML(to_xml)
      xsd = load_schema
      xsd.validate(xml_doc)
    end

    private

    def build_hierarchical_xml(xml, entities, parent_path)
      # Group entities by their immediate section under parent_path
      grouped = entities.group_by { |e| get_immediate_section(e, parent_path) }

      # Separate direct attributes from nested entities
      direct_attributes = grouped.delete("Attributes") || []
      nested_entities = grouped.except("Attributes")

      # Build ATTRIBUTES section if there are direct attributes
      if direct_attributes.any?
        xml.ATTRIBUTES do
          direct_attributes.sort_by { |e| e.class.sequence }.each { |e| e.build_xml(xml) }
        end
      end

      # Build ENTITIES section if there are nested entities
      if nested_entities.any?
        xml.ENTITIES do
          nested_entities.each do |entity_module_name, entity_list|
            # Get the full module path for this entity
            # If parent already contains "::Entities::", just append the entity name
            # Otherwise, add "::Entities::" before the entity name
            full_module_path = if parent_path.include?("::Entities::")
              "#{parent_path}::#{entity_module_name}"
            else
              "#{parent_path}::Entities::#{entity_module_name}"
            end
            entity_module = Object.const_get(full_module_path)

            # Build the entity XML with optional ID attribute
            xml_attributes = {entityId: entity_module.entity_id}

            # Add ID attribute if the entity requires it (for key constraints)
            # XML ID must start with a letter or underscore, so prefix with entity name
            if entity_module.respond_to?(:requires_id?) && entity_module.requires_id?
              @entity_id_counters[entity_module_name] += 1
              xml_attributes[:ID] = "#{entity_module_name}_#{@entity_id_counters[entity_module_name]}"
            end

            xml.send(entity_module.xml_tag, xml_attributes) do
              # Recursively build nested content
              build_hierarchical_xml(xml, entity_list, full_module_path)
            end
          end
        end
      end
    end

    def get_immediate_section(entity, parent_path)
      # Remove parent path prefix and get the immediate next section
      # e.g., parent: "Eccairs::Occurrence", entity: "Eccairs::Occurrence::Attributes::DewPoint" -> "Attributes"
      # e.g., parent: "Eccairs::Occurrence", entity: "Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::..." -> "AerodromeGeneral"
      # e.g., parent: "Eccairs::Occurrence::Entities::AerodromeGeneral", entity: "...::Narrative::Attributes::..." -> "Narrative"

      relative_path = entity.class.name.sub("#{parent_path}::", "")
      parts = relative_path.split("::")

      # If first part is "Entities", return the second part (the entity name)
      # If first part is "Attributes", return "Attributes"
      if parts.first == "Entities"
        parts[1]
      else
        parts.first
      end
    end

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
