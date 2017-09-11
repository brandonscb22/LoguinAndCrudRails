class CreateKardexProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :kardex_products do |t|
      t.date :registre_date
      t.decimal :quantity
      t.decimal :total_value
      t.references :meter, foreign_key: true
      t.references :production_order, foreign_key: true
      t.integer :number_sale
      t.references :product, foreign_key: true
      t.boolean :type_kpo

      t.timestamps
    end
  end
end
