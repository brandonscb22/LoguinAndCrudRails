class CreateActivityByProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_by_products do |t|
      t.references :activity, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
