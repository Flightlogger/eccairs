# frozen_string_literal: true

module Eccairs
  module Attributes
    class PhenomenonType < Eccairs::Base::EnumAttribute
      enums_from :phenomenon_type
    end
  end
end
