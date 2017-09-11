class CreateIndirectActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :indirect_activities do |t|
      t.string :name

      t.timestamps
    end
  end
end
