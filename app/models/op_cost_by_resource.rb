class OpCostByResource < ApplicationRecord
  belongs_to :meter
  belongs_to :resource
  belongs_to :subresource
  belongs_to :activity_by_product
  #belongs_to :production_order_identifier
end