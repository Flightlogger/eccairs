#!/usr/bin/env ruby
# frozen_string_literal: true

require "csv"
require "fileutils"

# ECCAIRS Datatype mapping
DATATYPE_MAP = {
  "1" => :string,
  "3" => :integer,
  "4" => :decimal,
  "5" => :enum,
  "6" => :text,
  "8" => :latitude,
  "9" => :longitude,
  "12" => :multi_enum,
  "13" => :fir_uir,
  "14" => :date,
  "15" => :time
}

def load_value_list(vl_id)
  vl_path = File.expand_path("../../docs/Eccairs Aviation v5100 RITedb/mappings/#{vl_id}.csv", __FILE__)
  return nil unless File.exist?(vl_path)

  values = []
  CSV.foreach(vl_path, headers: true, col_sep: "\t") do |row|
    value_id = row["Value ID"]
    values << value_id if value_id && !value_id.empty?
  end
  values.uniq.first(3) # Just get first 3 for testing
end

def generate_spec_content(attr_name, attr_id, datatype, valuelist_id)
  # Replace hyphens with underscores for class name generation
  class_name = attr_name.tr("-", "_").split("_").map(&:capitalize).join

  content = <<~RUBY
    # frozen_string_literal: true
    
    require "spec_helper"
    
    RSpec.describe Eccairs::Occurrence::Entities::#{class_name} do
      describe "#initialize" do
        it "initializes with nil value by default" do
          entity = described_class.new
          expect(entity.value).to be_nil
        end
    
        it "initializes with provided value" do
  RUBY

  case DATATYPE_MAP[datatype]
  when :enum
    if valuelist_id && !valuelist_id.empty?
      values = load_value_list(valuelist_id)
      if values && values.any?
        first_value = values.first.to_i
        content += "          entity = described_class.new(#{first_value})\n"
        content += "          expect(entity.value).to eq(#{first_value})\n"
      else
        content += "          entity = described_class.new(1)\n"
        content += "          expect(entity.value).to eq(1)\n"
      end
    else
      content += "          entity = described_class.new(1)\n"
      content += "          expect(entity.value).to eq(1)\n"
    end
  when :decimal, :latitude, :longitude
    content += "          entity = described_class.new(15.5)\n"
    content += "          expect(entity.value).to eq(15.5)\n"
  when :integer
    content += "          entity = described_class.new(42)\n"
    content += "          expect(entity.value).to eq(42)\n"
  when :string, :text, :date, :time
    content += "          entity = described_class.new(\"test value\")\n"
    content += "          expect(entity.value).to eq(\"test value\")\n"
  else
    content += "          entity = described_class.new(\"test\")\n"
    content += "          expect(entity.value).to eq(\"test\")\n"
  end

  content += <<~RUBY
      end
    end

    describe ".attribute_id" do
      it "returns attribute ID of #{attr_id}" do
        expect(described_class.attribute_id).to eq("#{attr_id}")
      end
    end

    describe "#build_xml" do
      it "generates valid XML with value" do
  RUBY

  case DATATYPE_MAP[datatype]
  when :enum
    if valuelist_id && !valuelist_id.empty?
      values = load_value_list(valuelist_id)
      if values && values.any?
        first_value = values.first.to_i
        content += "          entity = described_class.new(#{first_value})\n"
      else
        content += "          entity = described_class.new(1)\n"
      end
    else
      content += "          entity = described_class.new(1)\n"
    end
  when :decimal, :latitude, :longitude
    content += "          entity = described_class.new(15.5)\n"
  when :integer
    content += "          entity = described_class.new(42)\n"
  when :string, :text, :date, :time
    content += "          entity = described_class.new(\"test value\")\n"
  else
    content += "          entity = described_class.new(\"test\")\n"
  end

  content += <<~RUBY
        builder = Nokogiri::XML::Builder.new
        entity.build_xml(builder)
        xml = builder.to_xml
        
        expect(xml).to include("#{attr_name}")
        expect(xml).to include('attributeId="#{attr_id}"')
      end

      it "does not generate XML when value is nil" do
        entity = described_class.new
        builder = Nokogiri::XML::Builder.new
        entity.build_xml(builder)
        xml = builder.to_xml
        
        expect(xml).not_to include("#{attr_name}")
      end
    end
  RUBY

  # Add validation tests for enums
  if DATATYPE_MAP[datatype] == :enum && valuelist_id && !valuelist_id.empty?
    values = load_value_list(valuelist_id)
    if values && values.any?
      content += <<~RUBY
        
        describe "validation" do
          it "accepts valid values" do
      RUBY

      values.each do |val|
        content += "            expect { described_class.new(#{val.to_i}) }.not_to raise_error\n"
      end

      content += <<~RUBY
          end

          it "raises error with invalid value" do
            expect { described_class.new(99999) }.to raise_error(Eccairs::ValidationError)
          end

          it "accepts nil value (optional attribute)" do
            expect { described_class.new(nil) }.not_to raise_error
          end
        end
      RUBY
    end
  end

  content += "end\n"
  content
end

# Read the Attributes.csv file
csv_path = File.expand_path("../../docs/Eccairs Aviation v5100 RITedb/mappings/Attributes.csv", __FILE__)
specs_dir = File.expand_path("../../spec/eccairs/occurrence/entities", __FILE__)

# Skip already created specs
skip_entities = ["Dew_Point", "Wx_Conditions", "Dang_Goods_Involved"]

CSV.foreach(csv_path, headers: true, col_sep: "\t") do |row|
  parent_entity = row["Parent Entity Synonym"]
  next unless parent_entity == "Occurrence"

  attr_name = row["Attribute Synonym"]
  next if skip_entities.include?(attr_name)

  attr_id = row["Attribute ID"]
  datatype = row["ECCAIRS Datatype"]
  valuelist_id = row["Valuelist ID"]

  # Generate the spec
  spec_content = generate_spec_content(attr_name, attr_id, datatype, valuelist_id)

  # Write to file
  file_name = attr_name.downcase.tr("-", "_") + "_spec.rb"
  file_path = File.join(specs_dir, file_name)

  File.write(file_path, spec_content)
  puts "Created: #{file_path}"
end

puts "\nDone! Generated all entity specs."
