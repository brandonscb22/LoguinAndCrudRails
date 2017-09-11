class AddProviderRefAndPositionRefToSubresources < ActiveRecord::Migration[5.0]
  def change
    add_reference :subresources, :provider, foreign_key: true
    add_reference :subresources, :position, foreign_key: true
  end
end
