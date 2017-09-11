class Meter < ApplicationRecord
    has_many :cost_by_resources , :dependent => :delete_all
    has_many :activity_by_products, through: :cost_by_resources
    has_many :resources, through: :cost_by_resources
    has_many :subresources, through: :cost_by_resources
end
