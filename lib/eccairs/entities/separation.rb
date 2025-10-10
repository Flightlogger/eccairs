# frozen_string_literal: true

module Eccairs
  module Entities
    class Separation < Eccairs::Base::Entity
      entity_id "34"
      xml_tag "Separation"

      belongs_to :occurrence

      # Nested entities
      has_many :separation_aircraft, class_name: "Eccairs::Entities::SeparationAircraft"

      # Attributes
      has_many :est_minimum_horiz_sep, class_name: "Eccairs::Attributes::EstMinimumHorizSep"
      has_many :est_vert_separation, class_name: "Eccairs::Attributes::EstVertSeparation"
      has_many :horizontal_rel_mvmt, class_name: "Eccairs::Attributes::HorizontalRelMvmt"
      has_many :military_a_c_involved, class_name: "Eccairs::Attributes::MilitaryACInvolved"
      has_many :min_horiz_sep_rec, class_name: "Eccairs::Attributes::MinHorizSepRec"
      has_many :rate_of_closure, class_name: "Eccairs::Attributes::RateOfClosure"
      has_many :req_minimum_horiz_sep, class_name: "Eccairs::Attributes::ReqMinimumHorizSep"
      has_many :req_vert_separation, class_name: "Eccairs::Attributes::ReqVertSeparation"
      has_many :vertical_sep_recorded, class_name: "Eccairs::Attributes::VerticalSepRecorded"
    end
  end
end
