# frozen_string_literal: true

module Eccairs
  module Entities
    class DangerousGoods < Eccairs::Base::Entity
      entity_id "43"
      xml_tag "Dangerous_Goods"
      requires_id

      belongs_to :occurrence

      # Attributes
      has_many :air_waybill_consignment_tracking_number, class_name: "Eccairs::Attributes::AirWaybillConsignmentTrackingNumber"
      has_many :dangerous_good, class_name: "Eccairs::Attributes::DangerousGood"
      has_many :number_of_inner_packages, class_name: "Eccairs::Attributes::NumberOfInnerPackages"
      has_many :origin_of_goods, class_name: "Eccairs::Attributes::OriginOfGoods"
      has_many :packing_group_class_7_category, class_name: "Eccairs::Attributes::PackingGroupClass7Category"
      has_many :quantity_per_inner_packaging, class_name: "Eccairs::Attributes::QuantityPerInnerPackaging"
      has_many :shipper_name, class_name: "Eccairs::Attributes::ShipperName"
      has_many :subsidiary_risk, class_name: "Eccairs::Attributes::SubsidiaryRisk"
      has_many :total_number_of_packages_in_consignment, class_name: "Eccairs::Attributes::TotalNumberOfPackagesInConsignment"
      has_many :type_of_inner_packaging, class_name: "Eccairs::Attributes::TypeOfInnerPackaging"
      has_many :type_of_outer_packaging, class_name: "Eccairs::Attributes::TypeOfOuterPackaging"
    end
  end
end
