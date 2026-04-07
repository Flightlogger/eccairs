# frozen_string_literal: true

module Eccairs
  module Attributes
    class AirspaceType < Eccairs::Base::EnumAttribute
      enums_from :airspace_type
    end
  end
end
