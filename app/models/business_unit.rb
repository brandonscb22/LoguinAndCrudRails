class BusinessUnit < ApplicationRecord
	has_many :macroprocesses , :dependent => :destroy
end
