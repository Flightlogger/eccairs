# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module PartInformation
            module Attributes
              class AtaChapterNumber < Eccairs::Base::StringEntity
                attribute_id 659
                xml_tag "ATA_Chapter_Number"
                sequence 4
              end
            end
          end
        end
      end
    end
  end
end
