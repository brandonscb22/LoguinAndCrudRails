class CreateMacroprocesses < ActiveRecord::Migration[5.0]
  def change
    create_table :macroprocesses do |t|
      t.string :name
      t.references :business_unit, foreign_key: true

      t.timestamps
    end
  end
end
