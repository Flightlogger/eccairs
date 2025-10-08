# frozen_string_literal: true

require "builder"

module Eccairs
  class Report
    SET_ATTRS = {
      "xmlns": "http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataBridge.xsd",
      "xmlns:dt": "http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd",
      "TaxonomyName": "ECCAIRS Aviation",
      "TaxonomyVersion": "4.1.0.3",
      "Domain": "RIT",
      "Version": "1.0.0.0"
    }.freeze

    attr_reader :xml_markup, :occurrences

    def initialize
      @xml_markup = Builder::XmlMarkup.new(indent: 2)
      @occurrences = []
    end

    def to_xml
      instruct
      set do
        @occurrences.each do |occurrence|
          occurrence.to_xml(xml_markup)
        end
      end

      xml_markup.target!
    end

    def add_occurrence(occurrence)
      @occurrences << occurrence
      occurrence
    end

    private

    def instruct
      xml_markup.instruct!(:xml, version: "1.0", encoding: "UTF-8")
    end

    def set(&block)
      xml_markup.SET(**SET_ATTRS) { instance_eval(&block) }
    end
  end
end
