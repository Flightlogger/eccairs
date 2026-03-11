# frozen_string_literal: true

module Eccairs
  module Attributes
    class AirworthinessCert < Eccairs::Base::EnumAttribute
      enums_from :airworthiness_cert
    end
  end
end
