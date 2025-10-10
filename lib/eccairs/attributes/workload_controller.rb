# frozen_string_literal: true

module Eccairs
  module Attributes
    class WorkloadController < Eccairs::Base::EnumAttribute
      attribute_id 559
      xml_tag "Workload_Controller"
      sequence 2
      allowed_values [1, 100, 2, 101, 3, 99]
    end
  end
end
