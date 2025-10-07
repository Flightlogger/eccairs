# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

module Eccairs
  class Error < StandardError; end

  def self.create_report
    xml_markup = Builder::XmlMarkup.new
    xml_markup.div { strong("text") }
  end
end
