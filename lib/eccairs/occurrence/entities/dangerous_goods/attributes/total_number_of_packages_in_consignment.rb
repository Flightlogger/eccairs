# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module DangerousGoods
        module Attributes
          class TotalNumberOfPackagesInConsignment < Eccairs::Base::Entity
            attribute_id 1054
            xml_tag "Total_Number_Of_Packages_In_Consignment"
            sequence 4
            validates_numericality min: 0, max: 999999, type: :integer
          end
        end
      end
    end
  end
end
