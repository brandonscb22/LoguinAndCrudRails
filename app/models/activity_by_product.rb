class ActivityByProduct < ApplicationRecord
  has_many :cost_by_resources , :dependent => :destroy
  has_many :op_cost_by_resources, :dependent => :destroy
  has_many :meters, through: :cost_by_resources
  has_many :resources, through: :cost_by_resources
  has_many :subresources, through: :cost_by_resources
  belongs_to :activity
  belongs_to :product
end
