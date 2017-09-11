class Macroprocess < ApplicationRecord
	has_many :procedures, :dependent => :destroy
	belongs_to :business_unit
end
