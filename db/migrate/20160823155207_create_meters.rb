class CreateMeters < ActiveRecord::Migration[5.0]
  def change
    create_table :meters do |t|
      t.string :unity
      t.string :type_unity

      t.timestamps
    end
  end
end
