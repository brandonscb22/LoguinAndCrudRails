class RemoveColumnsOrderProduction < ActiveRecord::Migration[5.0]
  def change
    remove_column :production_orders , :id_po
    remove_column :production_orders , :date_start
    remove_column :production_orders , :date_end
    remove_column :production_orders , :status
  end
end
