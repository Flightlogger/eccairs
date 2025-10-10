# frozen_string_literal: true

module Eccairs
  module Entities
    class Events < Eccairs::Base::Entity
      entity_id "14"
      xml_tag "Events"
      requires_id

      belongs_to :occurrence

      # Attributes
      has_many :event_type, class_name: "Eccairs::Attributes::EventType"
      has_many :phase, class_name: "Eccairs::Attributes::Phase"
    end
  end
end
