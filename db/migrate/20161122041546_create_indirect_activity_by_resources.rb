class CreateIndirectActivityByResources < ActiveRecord::Migration[5.0]
  def change
    create_table :indirect_activity_by_resources do |t|
      t.references :resource, foreign_key: true
      t.references :subresource, foreign_key: true
      t.decimal :quantity
      t.decimal :cost
      t.references :meter, foreign_key: true
      t.references :indirect_activity, foreign_key: true

      t.timestamps
    end
  end
end
