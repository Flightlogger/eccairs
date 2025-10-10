# frozen_string_literal: true

module Eccairs
  module Attributes
    class AirWaybillConsignmentTrackingNumber < Eccairs::Base::StringAttribute
      attribute_id 1052
      xml_tag "Air_Waybill_Consignment_Tracking_Number"
      sequence 2
    end
  end
end
