class IndirectActivity < ApplicationRecord
  has_many :indirect_activity_by_resources , :dependent => :destroy
  has_many :indirect_activity_by_products , :dependent => :destroy
  belongs_to :management_unit
  belongs_to :subprocedure
end
