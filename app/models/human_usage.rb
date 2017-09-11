class HumanUsage < ApplicationRecord
  belongs_to :subresource
  belongs_to :meter
end
