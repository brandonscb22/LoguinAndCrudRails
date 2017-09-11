class CreateProductionOrderIdentifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :production_order_identifiers do |t|

      t.timestamps
    end
  end
end
