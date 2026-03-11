# frozen_string_literal: true

module Eccairs
  module Attributes
    class AerodromeType < Eccairs::Base::EnumAttribute
      enums_from :aerodrome_type
    end
  end
end
