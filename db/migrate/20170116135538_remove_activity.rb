class RemoveActivity < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :generator_id
  end
end
