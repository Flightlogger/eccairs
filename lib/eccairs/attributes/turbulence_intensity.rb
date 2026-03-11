# frozen_string_literal: true

module Eccairs
  module Attributes
    class TurbulenceIntensity < Eccairs::Base::EnumAttribute
      enums_from :turbulence_intensity
    end
  end
end
