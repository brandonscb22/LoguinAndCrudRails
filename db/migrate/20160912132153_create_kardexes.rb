class CreateKardexes < ActiveRecord::Migration[5.0]
  def change
    create_table :kardexes do |t|
      t.boolean :type
      t.date :registration_date
      t.references :provider, foreign_key: true
      t.references :subresource, foreign_key: true
      t.decimal :quantity
      t.decimal :total_value
      t.references :meter, foreign_key: true

      t.timestamps
    end
  end
end
