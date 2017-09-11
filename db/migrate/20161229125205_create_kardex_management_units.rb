class CreateKardexManagementUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :kardex_management_units do |t|
      t.references :management_unit, foreign_key: true
      t.decimal :quantity
      t.date :day_of_entry

      t.timestamps
    end
  end
end
