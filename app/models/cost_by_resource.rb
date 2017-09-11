class CostByResource < ApplicationRecord
  belongs_to :activity_by_product
  belongs_to :meter
  belongs_to :resource
  belongs_to :subresource
end
