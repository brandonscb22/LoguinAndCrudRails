class Subresource < ApplicationRecord
  has_many :cost_by_resources , :dependent => :delete_all
  has_many :activity_by_products, through: :cost_by_resources
  has_many :resources, through: :cost_by_resources
  has_many :meters, through: :cost_by_resources
  belongs_to :resource
  belongs_to :meter
  belongs_to :provider
  belongs_to :position
end
