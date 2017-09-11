class CreateKardexGenerators < ActiveRecord::Migration[5.0]
  def change
    create_table :kardex_generators do |t|
      t.decimal :quantity
      t.boolean :status_month
      t.date :day_of_entry
      t.references :generator, foreign_key: true

      t.timestamps
    end
  end
end
