class IndirectActivityByProduct < ApplicationRecord
  belongs_to :product
  belongs_to :indirect_activity
  attr_accessor :name
end
