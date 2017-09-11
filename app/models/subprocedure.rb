class Subprocedure < ApplicationRecord
  has_many :activities , :dependent => :destroy
  has_many :indirect_activities, :dependent => :destroy
  belongs_to :procedure
end
