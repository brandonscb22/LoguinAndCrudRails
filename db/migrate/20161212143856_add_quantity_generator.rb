class AddQuantityGenerator < ActiveRecord::Migration[5.0]
  def change
    add_column :generators , :quantity , :decimal
  end
end
