class CreateKardexAcs < ActiveRecord::Migration[5.0]
  def change
    create_table :kardex_acs do |t|

      t.timestamps
    end
  end
end
