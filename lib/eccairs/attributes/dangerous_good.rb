# frozen_string_literal: true

module Eccairs
  module Attributes
    class DangerousGood < Eccairs::Base::EnumAttribute
      enums_from :dangerous_good
    end
  end
end
