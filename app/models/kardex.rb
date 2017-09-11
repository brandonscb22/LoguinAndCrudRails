class Kardex < ApplicationRecord
  belongs_to :provider
  belongs_to :subresource
  belongs_to :meter
end
