class Product < ApplicationRecord
  has_many :activity_by_products , :dependent => :delete_all
  has_many :activities, through: :activity_by_products
  belongs_to :macroproduct
end
