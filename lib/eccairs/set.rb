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
      # Group entities by their immediate child module path
      grouped = entities.group_by { |e| get_immediate_child_module(e, parent_module_path) }

      # Separate leaf attributes from nested entity modules
      leaf_attributes, nested_entities = grouped.partition do |module_path, _|
        # Leaf attributes are directly under parent (e.g., "Attributes")
        # Nested entities have deeper paths (e.g., "Entities::Aircraft")
        !module_path.include?("::")
      end.map(&:to_h)

      # Build ATTRIBUTES section for leaf attributes
      if leaf_attributes.any?
        xml.ATTRIBUTES do
          leaf_attributes.values.flatten.sort_by { |e| e.class.sequence }.each { |e| e.build_xml(xml) }
        end
      end

      # Build ENTITIES section for nested entity modules
      if nested_entities.any?
        xml.ENTITIES do
          nested_entities.each do |module_path, module_entities|
            child_module = Object.const_get("#{parent_module_path}::#{module_path}")
            build_module_xml(xml, child_module, module_entities)
          end
        end
      end
    end

    def get_immediate_child_module(entity, parent_module_path)
      # Get the relative path from parent to entity's class
      relative_path = entity.class.name.sub("#{parent_module_path}::", "")
      parts = relative_path.split("::")

      # Return immediate child module path:
      # - For leaf attributes: just the namespace (e.g., "Attributes")
      # - For nested entities: namespace + entity name (e.g., "Entities::Aircraft")
      (parts.length == 2) ? parts.first : parts[0..1].join("::")
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
