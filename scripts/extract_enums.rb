#!/usr/bin/env ruby
# frozen_string_literal: true

# One-shot script: parses the ECCAIRS Aviation XML dictionary and writes
# one YAML file per PredefinedValueList attribute under config/enums/.
#
# Usage:
#   ruby scripts/extract_enums.rb /path/to/ECCAIRS\ Aviation\ 5.1.1.2\ 5.1.1.2.xml

require "nokogiri"
require "yaml"
require "fileutils"
require "csv"

SCRIPT_DIR = __dir__
PROJECT_DIR = File.expand_path("..", SCRIPT_DIR)
ENUMS_DIR = File.join(PROJECT_DIR, "config", "enums")
CSV_PATH = File.join(PROJECT_DIR, "docs", "Eccairs Aviation v5100 RITedb", "mappings", "Attributes.csv")

xml_path = ARGV[0]
unless xml_path && File.file?(xml_path)
  warn "Usage: ruby scripts/extract_enums.rb /path/to/ECCAIRS_XML_FILE"
  exit 1
end

def build_sequence_map(csv_path)
  map = {}
  return map unless File.file?(csv_path)

  CSV.foreach(csv_path, col_sep: "\t", headers: true, liberal_parsing: true) do |row|
    attr_id = row["Attribute ID"]&.strip&.delete('"')
    seq = row["Attribute Sequence"]&.strip&.delete('"')
    next unless attr_id && seq && !attr_id.empty? && !seq.empty?

    map[attr_id] = seq.to_i
  end
  map
end

def collect_values(values_node)
  map = {}
  values_node.xpath(".//VALUE").each do |v|
    id = v["ID"]
    desc = v["DESCRIPTION"]
    next unless id && !id.empty?

    int_id = id.to_i
    map[int_id] ||= desc.to_s
  end
  map.sort_by { |k, _| k }.to_h
end

def build_hierarchy(parent_node)
  children = parent_node.xpath("VALUE")
  return nil if children.empty?

  children.map do |v|
    id = v["ID"]
    desc = v["DESCRIPTION"]
    next unless id && !id.empty?

    node = {"id" => id.to_i, "description" => desc.to_s}
    sub = build_hierarchy(v)
    node["children"] = sub if sub
    node
  end.compact
end

def multilevel?(values_node)
  values_node.xpath("VALUE").any? { |v| v.xpath("VALUE").size > 0 }
end

puts "Loading Attributes.csv for sequence data..."
seq_map = build_sequence_map(CSV_PATH)
puts "  Found #{seq_map.size} attribute sequences."

puts "Reading ECCAIRS XML (#{xml_path})..."
raw = File.binread(xml_path).force_encoding("UTF-16")
utf8 = raw.encode("UTF-8")
bom = "\xEF\xBB\xBF".dup.force_encoding("UTF-8")
utf8 = utf8.sub(bom, "")
utf8.lstrip!
utf8.sub!('encoding="UTF-16"', 'encoding="UTF-8"')

puts "Parsing XML with Nokogiri..."
doc = Nokogiri::XML(utf8) { |config| config.noblanks.huge }

FileUtils.mkdir_p(ENUMS_DIR)
FileUtils.rm_f(Dir.glob(File.join(ENUMS_DIR, "*.yml")))

attrs = doc.xpath("//ATTRIBUTE[@VALUE-TYPE='PredefinedValueList']")
puts "Found #{attrs.size} PredefinedValueList attributes."

tag_counts = Hash.new(0)
attrs.each { |a| tag_counts[a["XSD-TAG"]&.downcase] += 1 if a["XSD-TAG"] }
duplicated_tags = tag_counts.select { |_, c| c > 1 }.keys.to_set

written = 0
attrs.each do |attr|
  attribute_id = attr["ID"]
  xsd_tag = attr["XSD-TAG"]
  next unless attribute_id && xsd_tag && !xsd_tag.empty?

  base_key = xsd_tag.downcase
  key = duplicated_tags.include?(base_key) ? "#{base_key}_#{attribute_id}" : base_key

  values_node = attr.at_xpath("VALUES")
  next unless values_node

  values = collect_values(values_node)
  next if values.empty?

  sequence = seq_map[attribute_id]

  data = {
    "attribute_id" => attribute_id.to_s,
    "xml_tag" => xsd_tag,
    "sequence" => sequence,
    "values" => values
  }

  if multilevel?(values_node)
    data["hierarchy"] = build_hierarchy(values_node)
  end

  out_path = File.join(ENUMS_DIR, "#{key}.yml")
  yaml = data.to_yaml
  yaml = yaml.sub(/\A---\n/, "") if yaml.start_with?("---\n")
  File.write(out_path, yaml)
  written += 1
end

puts "Wrote #{written} YAML files to #{ENUMS_DIR}/"
