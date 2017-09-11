class AddOrderProductionIdent < ActiveRecord::Migration[5.0]
  def change
    add_column :production_order_identifiers , :date_start , :date
    add_column :production_order_identifiers , :date_end, :date
    add_column :production_order_identifiers , :status, :integer
  end
end
