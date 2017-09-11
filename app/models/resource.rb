class Resource < ApplicationRecord
	  has_many :subresources  , :dependent => :delete_all
    has_many :cost_by_resources , :dependent => :delete_all
    has_many :activity_by_products, through: :cost_by_resources
    has_many :meters, through: :cost_by_resources
end
