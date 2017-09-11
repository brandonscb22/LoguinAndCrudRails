class CreateHumanUsages < ActiveRecord::Migration[5.0]
  def change
    create_table :human_usages do |t|
      t.date :registration_date
      t.references :subresource, foreign_key: true
      t.decimal :quantity
      t.references :meter, foreign_key: true

      t.timestamps
    end
  end
end
