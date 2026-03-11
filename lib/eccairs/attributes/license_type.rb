# frozen_string_literal: true

module Eccairs
  module Attributes
    class LicenseType < Eccairs::Base::EnumAttribute
      enums_from :license_type
    end
  end
end
