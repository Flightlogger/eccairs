# frozen_string_literal: true

module Eccairs
  module Attributes
    class AerodromeStatus < Eccairs::Base::EnumAttribute
      enums_from :aerodrome_status
    end
  end
end
