# frozen_string_literal: true

require "nokogiri"

module Eccairs
  class Report
    SET_ATTRS = {
      "xmlns" => "http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataBridge.xsd",
      "xmlns:dt" => "http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd",
      "TaxonomyName" => "ECCAIRS Aviation",
      "TaxonomyVersion" => "4.1.0.3",
      "Domain" => "RIT",
      "Version" => "1.0.0.0"
    }.freeze

    attr_reader :occurrences

    def initialize
      @occurrences = []
    end

    def to_xml
      builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
        xml.SET(SET_ATTRS) do
          @occurrences.each do |occurrence|
            occurrence.to_xml(xml)
          end
        end
      end

      builder.to_xml
    end

    def add_occurrence(occurrence)
      @occurrences << occurrence
      occurrence
    end
  end
end
