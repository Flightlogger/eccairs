# frozen_string_literal: true

module Eccairs
  module Entities
    class DangerousGoods < Eccairs::Base::Entity
      entity_id "43"
      xml_tag "Dangerous_Goods"
      requires_id

      # Add air waybill consignment tracking number
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AirWaybillConsignmentTrackingNumber] The created attribute instance
      # @note Attribute ID: 1052, XML Tag: Air_Waybill_Consignment_Tracking_Number
      def add_air_waybill_consignment_tracking_number(value)
        add_attribute(Eccairs::Attributes::AirWaybillConsignmentTrackingNumber, false, value)
      end

      # Add dangerous good
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::DangerousGood] The created attribute instance
      # @note Attribute ID: 688, XML Tag: Dangerous_Good
      def add_dangerous_good(value)
        add_attribute(Eccairs::Attributes::DangerousGood, false, value)
      end

      # Add number of inner packages
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::NumberOfInnerPackages] The created attribute instance
      # @note Attribute ID: 1058, XML Tag: Number_Of_Inner_Packages
      def add_number_of_inner_packages(value)
        add_attribute(Eccairs::Attributes::NumberOfInnerPackages, false, value)
      end

      # Add origin of goods
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::OriginOfGoods] The created attribute instance
      # @note Attribute ID: 1051, XML Tag: Origin_Of_Goods
      def add_origin_of_goods(value)
        add_attribute(Eccairs::Attributes::OriginOfGoods, false, value)
      end

      # Add packing group class 7 category
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PackingGroupClass7Category] The created attribute instance
      # @note Attribute ID: 1057, XML Tag: Packing_Group_Class_7_Category
      def add_packing_group_class_7_category(value)
        add_attribute(Eccairs::Attributes::PackingGroupClass7Category, value)
      end

      # Add quantity per inner packaging
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::QuantityPerInnerPackaging] The created attribute instance
      # @note Attribute ID: 1060, XML Tag: Quantity_Per_Inner_Packaging
      def add_quantity_per_inner_packaging(value)
        add_attribute(Eccairs::Attributes::QuantityPerInnerPackaging, false, value)
      end

      # Add shipper name
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ShipperName] The created attribute instance
      # @note Attribute ID: 1053, XML Tag: Shipper_Name
      def add_shipper_name(value)
        add_attribute(Eccairs::Attributes::ShipperName, false, value)
      end

      # Add subsidiary risk
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SubsidiaryRisk] The created attribute instance
      # @note Attribute ID: 1055, XML Tag: Subsidiary_Risk
      def add_subsidiary_risk(value)
        add_attribute(Eccairs::Attributes::SubsidiaryRisk, false, value)
      end

      # Add total number of packages in consignment
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalNumberOfPackagesInConsignment] The created attribute instance
      # @note Attribute ID: 1054, XML Tag: Total_Number_Of_Packages_In_Consignment
      def add_total_number_of_packages_in_consignment(value)
        add_attribute(Eccairs::Attributes::TotalNumberOfPackagesInConsignment, false, value)
      end

      # Add type of inner packaging
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TypeOfInnerPackaging] The created attribute instance
      # @note Attribute ID: 1059, XML Tag: Type_Of_Inner_Packaging
      def add_type_of_inner_packaging(value)
        add_attribute(Eccairs::Attributes::TypeOfInnerPackaging, false, value)
      end

      # Add type of outer packaging
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TypeOfOuterPackaging] The created attribute instance
      # @note Attribute ID: 1056, XML Tag: Type_Of_Outer_Packaging
      def add_type_of_outer_packaging(value)
        add_attribute(Eccairs::Attributes::TypeOfOuterPackaging, false, value)
      end
    end
  end
end
