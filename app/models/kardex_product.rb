class KardexProduct < ApplicationRecord
  belongs_to :meter
  belongs_to :production_order
  belongs_to :product
end
