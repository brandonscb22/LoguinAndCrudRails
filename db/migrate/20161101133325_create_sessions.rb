class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.datetime :time_init
      t.datetime :time_end
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
