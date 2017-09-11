class Procedure < ApplicationRecord
  has_many :subprocedures, :dependent => :destroy
  belongs_to :macroprocess
end
