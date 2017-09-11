class CreateOpCostByResources < ActiveRecord::Migration[5.0]
  def change
    create_table :op_cost_by_resources do |t|
      t.decimal :quantity
      t.references :meter, foreign_key: true
      t.references :resource, foreign_key: true
      t.references :subresource, foreign_key: true
      t.references :activity_by_product, foreign_key: true
      t.references :production_order, foreign_key: true
      t.decimal :cost

      t.timestamps
    end
  end
end
