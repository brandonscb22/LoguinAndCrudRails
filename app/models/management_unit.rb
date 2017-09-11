class ManagementUnit < ApplicationRecord
  has_many :kardex_management_units, :dependent => :delete_all
  has_many :indirect_activities, :dependent => :delete_all
end
