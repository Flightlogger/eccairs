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

    attr_reader :entities

    def initialize
      @entities = []
      @entity_id_counters = Hash.new(0)
    end

    def to_xml
      builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
        xml.SET(SET_ATTRS) do
          build_module_xml(xml, Occurrence, @entities)
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

    def build_module_xml(xml, entity_module, entities)
      # Build the entity XML element
      xml_attributes = {entityId: entity_module.entity_id}

      # Add ID attribute if required
      if entity_module.respond_to?(:requires_id?) && entity_module.requires_id?
        module_name = entity_module.name.split("::").last
        @entity_id_counters[module_name] += 1
        xml_attributes[:ID] = "#{module_name}_#{@entity_id_counters[module_name]}"
      end

      xml.send(entity_module.xml_tag, xml_attributes) do
        build_hierarchical_xml(xml, entities, entity_module.name)
      end
    end

    def build_hierarchical_xml(xml, entities, parent_module_path)
      # Group entities by their immediate child module
      grouped = entities.group_by { |e| get_immediate_child_module(e, parent_module_path) }

      # Separate attributes from entity modules
      attributes = grouped.delete("Attributes") || []
      entity_modules = grouped.reject { |k, _| k == "Attributes" }

      # Build ATTRIBUTES section
      if attributes.any?
        xml.ATTRIBUTES do
          attributes.sort_by { |e| e.class.sequence }.each { |e| e.build_xml(xml) }
        end
      end

      # Build ENTITIES section
      if entity_modules.any?
        xml.ENTITIES do
          entity_modules.each do |module_name, module_entities|
            # Resolve the full module path
            child_module_path = "#{parent_module_path}::#{module_name}"
            child_module = Object.const_get(child_module_path)

            # Recursively build this entity module
            build_module_xml(xml, child_module, module_entities)
          end
        end
      end
    end

    def get_immediate_child_module(entity, parent_module_path)
      # Get the relative path from parent to entity
      # e.g., parent: "Eccairs::Occurrence", entity: "Eccairs::Occurrence::Attributes::Headline" -> "Attributes"
      # e.g., parent: "Eccairs::Occurrence", entity: "Eccairs::Occurrence::Entities::Aircraft::..." -> "Entities::Aircraft"
      relative_path = entity.class.name.sub("#{parent_module_path}::", "")
      parts = relative_path.split("::")

      # Return the immediate child module
      # If it's "Attributes::Something", return "Attributes"
      # If it's "Entities::SomeName::...", return "Entities::SomeName"
      if parts.first == "Attributes"
        "Attributes"
      elsif parts.first == "Entities" && parts.length > 1
        "Entities::#{parts[1]}"
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
