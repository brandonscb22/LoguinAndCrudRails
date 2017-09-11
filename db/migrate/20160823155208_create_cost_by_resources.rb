class CreateCostByResources < ActiveRecord::Migration[5.0]
  def change
    create_table :cost_by_resources do |t|
      t.integer :quantity
      t.references :meter, foreign_key: true
      t.references :resource, foreign_key: true
      t.references :subresource, foreign_key: true

      t.timestamps
    end
  end
end
