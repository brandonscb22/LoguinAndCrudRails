class IndirectActivityByResource < ApplicationRecord
  belongs_to :resource
  belongs_to :subresource
  belongs_to :meter
  belongs_to :indirect_activity
end
