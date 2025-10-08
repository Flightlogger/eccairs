# frozen_string_literal: true

module Eccairs::Occurrence
  class DewPoint < BaseOccurrence
    def initialize
      super
      @attributes[:Local_Date] = "2014-08-13"
    end
  end
end
