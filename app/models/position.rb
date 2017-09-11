class Position < ApplicationRecord
  has_many :subresources , :dependent => :destroy
end
