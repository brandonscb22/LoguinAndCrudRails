class ProductionOrderIdentifier < ApplicationRecord
  has_many :production_order , :dependent => :destroy
end
