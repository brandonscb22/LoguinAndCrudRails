class RemoveErrorDeVictor < ActiveRecord::Migration[5.0]
  def change
    remove_column :generators , :quantity
  end
end
