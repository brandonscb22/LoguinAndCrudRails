class CreateManagementUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :management_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
