# frozen_string_literal: true

module Eccairs
  module Attributes
    class EventType < Eccairs::Base::EnumAttribute
      enums_from :event_type
    end
  end
end
