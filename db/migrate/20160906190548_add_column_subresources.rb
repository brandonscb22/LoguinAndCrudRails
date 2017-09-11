class AddColumnSubresources < ActiveRecord::Migration[5.0]
  def change
    add_column :subresources, :properties, :string
  end
end
