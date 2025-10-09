# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Entities
          module Sector
            module Entities
              module AtmStaff
                module Attributes
                  class Category < Eccairs::Base::EnumEntity
                    attribute_id 357
                    xml_tag "Category"
                    sequence 2
                    allowed_values [2, 12, 6, 4, 8, 5, 7, 3, 10, 9, 1, 11, 98]
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
