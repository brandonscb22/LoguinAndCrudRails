class RenameTypeData < ActiveRecord::Migration[5.0]
  def change
    remove_column :cost_by_resources, :quantity, :integer
    add_column :cost_by_resources, :quantity, :decimal
  end
end
