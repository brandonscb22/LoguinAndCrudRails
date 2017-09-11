class CreateKardexAps < ActiveRecord::Migration[5.0]
  def change
    create_table :kardex_aps do |t|

      t.timestamps
    end
  end
end
