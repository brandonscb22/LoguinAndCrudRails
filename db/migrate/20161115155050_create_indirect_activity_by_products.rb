class CreateIndirectActivityByProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :indirect_activity_by_products do |t|
      t.references :product, foreign_key: true
      t.references :indirect_activity, foreign_key: true

      t.timestamps
    end
  end
end
