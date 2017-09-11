class Activity < ApplicationRecord
  has_many :activity_by_products , :dependent => :destroy
  has_many :products, through: :activity_by_products
  belongs_to :subprocedure
end
