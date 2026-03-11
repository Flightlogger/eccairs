# frozen_string_literal: true

module Eccairs
  module Attributes
    class Ratings < Eccairs::Base::EnumAttribute
      enums_from :ratings
    end
  end
end
