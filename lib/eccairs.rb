# frozen_string_literal: true

require "eccairs/enums"
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

module Eccairs
  class Error < StandardError; end

  class ValidationError < Error; end

  def self.set
    Eccairs::Set.new
  end
end
