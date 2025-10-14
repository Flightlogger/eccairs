# frozen_string_literal: true

module Eccairs
  module Entities
    class Separation < Eccairs::Base::Entity
      entity_id "34"
      xml_tag "Separation"
      sequence 9

      # Add separation aircraft entity
      # @yield [separation_aircraft] Block for configuring the separation aircraft
      # @yieldparam separation_aircraft [Eccairs::Entities::SeparationAircraft] The entity instance
      # @return [Eccairs::Entities::SeparationAircraft] The created entity instance
      # @note Entity ID: 35, XML Tag: Separation_Aircraft
      def add_separation_aircraft(&block)
        add_entity(Eccairs::Entities::SeparationAircraft, false, &block)
      end

      # Add est minimum horiz sep
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::EstMinimumHorizSep] The created attribute instance
      # @note Attribute ID: 575, XML Tag: Est_Minimum_Horiz_Sep
      def add_est_minimum_horiz_sep(value)
        add_attribute(Eccairs::Attributes::EstMinimumHorizSep, false, value)
      end

      # Add est vert separation
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::EstVertSeparation] The created attribute instance
      # @note Attribute ID: 581, XML Tag: Est_Vert_Separation
      def add_est_vert_separation(value)
        add_attribute(Eccairs::Attributes::EstVertSeparation, false, value)
      end

      # Add horizontal rel mvmt
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::HorizontalRelMvmt] The created attribute instance
      # @note Attribute ID: 570, XML Tag: Horizontal_Rel_Mvmt
      def add_horizontal_rel_mvmt(value)
        add_attribute(Eccairs::Attributes::HorizontalRelMvmt, false, value)
      end

      # Add military a c involved
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::MilitaryACInvolved] The created attribute instance
      # @note Attribute ID: 574, XML Tag: Military_A_C_Involved
      def add_military_a_c_involved(value)
        add_attribute(Eccairs::Attributes::MilitaryACInvolved, false, value)
      end

      # Add min horiz sep rec
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::MinHorizSepRec] The created attribute instance
      # @note Attribute ID: 579, XML Tag: Min_Horiz_Sep_Rec
      def add_min_horiz_sep_rec(value)
        add_attribute(Eccairs::Attributes::MinHorizSepRec, false, value)
      end

      # Add rate of closure
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RateOfClosure] The created attribute instance
      # @note Attribute ID: 588, XML Tag: Rate_Of_Closure
      def add_rate_of_closure(value)
        add_attribute(Eccairs::Attributes::RateOfClosure, false, value)
      end

      # Add req minimum horiz sep
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ReqMinimumHorizSep] The created attribute instance
      # @note Attribute ID: 577, XML Tag: Req_Minimum_Horiz_Sep
      def add_req_minimum_horiz_sep(value)
        add_attribute(Eccairs::Attributes::ReqMinimumHorizSep, false, value)
      end

      # Add req vert separation
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ReqVertSeparation] The created attribute instance
      # @note Attribute ID: 583, XML Tag: Req_Vert_Separation
      def add_req_vert_separation(value)
        add_attribute(Eccairs::Attributes::ReqVertSeparation, false, value)
      end

      # Add vertical sep recorded
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::VerticalSepRecorded] The created attribute instance
      # @note Attribute ID: 585, XML Tag: Vertical_Sep_Recorded
      def add_vertical_sep_recorded(value)
        add_attribute(Eccairs::Attributes::VerticalSepRecorded, false, value)
      end
    end
  end
end
