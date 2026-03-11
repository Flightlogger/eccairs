# frozen_string_literal: true

module Eccairs
  module Attributes
    class Manufacturer < Eccairs::Base::EnumAttribute
      enums_from :manufacturer
    end
  end
end
