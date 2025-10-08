#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'
require 'fileutils'

# ECCAIRS Datatype mapping
# 1 = String
# 3 = Integer
# 4 = Decimal (with unit)
# 5 = Enum (valuelist)
# 6 = Text (long string)
# 8 = Latitude
# 9 = Longitude
# 12 = Multi-select enum
# 13 = FIR/UIR
# 14 = Date
# 15 = Time

DATATYPE_MAP = {
  '1' => :string,
  '3' => :integer,
  '4' => :decimal,
  '5' => :enum,
  '6' => :text,
  '8' => :latitude,
  '9' => :longitude,
  '12' => :multi_enum,
  '13' => :fir_uir,
  '14' => :date,
  '15' => :time
}

# Unit mapping (UM default column)
UNIT_MAP = {
  '101' => 'C',           # Celsius
  '202' => 'm',           # meters
  '401' => 'kt',          # knots
  '901' => 'kg',          # kilograms
  '1001' => 'Degree(s)',  # degrees
  '2001' => 'ft'          # feet
}

def load_value_list(vl_id)
  vl_path = File.expand_path("../../docs/Eccairs Aviation v5100 RITedb/mappings/#{vl_id}.csv", __FILE__)
  return nil unless File.exist?(vl_path)

  values = []
  CSV.foreach(vl_path, headers: true, col_sep: "\t") do |row|
    value_id = row['Value ID']
    values << value_id if value_id && !value_id.empty?
  end
  values.uniq
end

def generate_enum_hash(values)
  # Try to create meaningful constant names
  enum_hash = {}

  values.each do |val|
    # Create constant name from value
    const_name = case val
    when '1' then 'YES'
    when '2' then 'NO'
    when '99' then 'UNKNOWN'
    else "VALUE_#{val}"
    end

    enum_hash[const_name.to_sym] = val.to_i
  end

  enum_hash
end

def generate_entity_class(attr_name, attr_id, datatype, unit, valuelist_id, sequence)
  # Replace hyphens with underscores for class name generation
  class_name = attr_name.gsub('-', '_').split('_').map(&:capitalize).join

  content = <<~RUBY
    # frozen_string_literal: true

    module Eccairs
      module Occurrence
        module Entities
          class #{class_name} < BaseEntity
            attribute_id #{attr_id}
            xml_tag "#{attr_name}"
            sequence #{sequence}
  RUBY

  case DATATYPE_MAP[datatype]
  when :enum
    if valuelist_id && !valuelist_id.empty?
      values = load_value_list(valuelist_id)
      if values && values.any?
        enum_hash = generate_enum_hash(values)
        content += "            validates_inclusion within: {\n"
        enum_hash.each do |key, val|
          content += "              #{key}: #{val},\n"
        end
        content = content.chomp(",\n") + "\n"
        content += "            }\n"
      end
    end
  when :decimal
    # Add numeric validation with unit
    content += "            validates_numericality min: -1000, max: 100000, type: :decimal\n"
    if unit && UNIT_MAP[unit]
      content += "\n            protected\n\n"
      content += "            def additional_xml_attributes\n"
      content += "              { Unit: \"#{UNIT_MAP[unit]}\" }\n"
      content += "            end\n"
    end
  when :integer
    content += "            validates_numericality min: 0, max: 100000, type: :integer\n"
  when :string, :text
    # No validation for now
  when :latitude
    content += "            validates_numericality min: -90.0, max: 90.0, type: :decimal\n"
  when :longitude
    content += "            validates_numericality min: -180.0, max: 180.0, type: :decimal\n"
  when :date, :time
    # Date/time validation would go here
  end

  content += "          end\n"
  content += "        end\n"
  content += "      end\n"
  content += "    end\n"

  content
end

# Read the AttributeList.csv file (has entity path info)
csv_path = File.expand_path('../../docs/Eccairs Aviation v5100 RITedb/documents/AttributeList.csv', __FILE__)
base_entities_dir = File.expand_path('../../lib/eccairs', __FILE__)

# Skip already created entities
skip_entities = ['Dew_Point', 'Wx_Conditions', 'Dang_Goods_Involved']

CSV.foreach(csv_path, headers: true, col_sep: "\t") do |row|
  entity_path = row['Entity name path for RIT']
  next unless entity_path && entity_path.start_with?('Occurrence')

  attr_name = row['Attribute synonym for RIT']
  next if skip_entities.include?(attr_name)
  next unless attr_name && !attr_name.empty?

  attr_id = row['Attribute ID']

  # Get datatype info from Attributes.csv mapping
  # For now, we'll need to look this up separately or use a simpler approach
  # Let's just create the directory structure for Occurrence entities first

  # Parse the entity path to create directory structure
  # e.g., "Occurrence" -> lib/eccairs/occurrence/entities/
  # e.g., "Occurrence/Aerodrome_General" -> lib/eccairs/occurrence/aerodrome_general/
  path_parts = entity_path.split('/')

  if path_parts.length == 1
    # Direct Occurrence attribute
    dir_path = File.join(base_entities_dir, 'occurrence', 'entities')
  else
    # Nested entity (e.g., Aerodrome_General under Occurrence)
    # Convert to snake_case for directory names
    nested_path = path_parts[1..-1].map { |p| p.downcase.gsub('_', '_') }.join('/')
    dir_path = File.join(base_entities_dir, 'occurrence', nested_path)
  end

  FileUtils.mkdir_p(dir_path)

  # For now, just print what we would create
  file_name = attr_name.downcase.gsub('-', '_') + '.rb'
  file_path = File.join(dir_path, file_name)

  puts "Would create: #{file_path} (Entity Path: #{entity_path})"
end

puts "\nDone! Analyzed entity structure."
