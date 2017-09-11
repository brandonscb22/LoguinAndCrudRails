class CreateGenerators < ActiveRecord::Migration[5.0]
  def change
    create_table :generators do |t|
      t.string :name
      t.string :unity

      t.timestamps
    end
  end
end
