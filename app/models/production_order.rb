class ProductionOrder < ApplicationRecord
  attr_accessor :status
  attr_accessor :date_start
  attr_accessor :date_end
  belongs_to :production_order_identifier
  belongs_to :product
  has_many :op_cost_by_resource, :dependent => :delete_all

end
