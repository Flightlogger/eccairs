# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Entities
          module Sector
            module Attributes
              class WorkloadController < Eccairs::Base::Entity
                attribute_id 559
                xml_tag "Workload_Controller"
                sequence 2
                validates_inclusion within: [1, 100, 2, 101, 3, 99]
              end
            end
          end
        end
      end
    end
  end
end
