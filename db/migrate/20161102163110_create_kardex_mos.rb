class CreateKardexMos < ActiveRecord::Migration[5.0]
  def change
    create_table :kardex_mos do |t|

      t.timestamps
    end
  end
end
