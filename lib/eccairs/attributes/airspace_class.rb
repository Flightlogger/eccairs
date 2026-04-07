# frozen_string_literal: true

module Eccairs
  module Attributes
    class AirspaceClass < Eccairs::Base::EnumAttribute
      enums_from :airspace_class
    end
  end
end
