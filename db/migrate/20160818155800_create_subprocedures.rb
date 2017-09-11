class CreateSubprocedures < ActiveRecord::Migration[5.0]
  def change
    create_table :subprocedures do |t|
      t.string :name
      t.references :procedure, foreign_key: true

      t.timestamps
    end
  end
end
