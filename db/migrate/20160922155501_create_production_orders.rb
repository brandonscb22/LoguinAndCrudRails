class CreateProductionOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :production_orders do |t|
      t.integer :id_po
      t.references :product, foreign_key: true
      t.decimal :quantity
      t.date :date_start
      t.date :date_end
      t.integer :status
      t.decimal :total_cost

      t.timestamps
    end
  end
end
