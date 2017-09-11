class RemoveGeneratorIndirectActivity < ActiveRecord::Migration[5.0]
  def change
    remove_column :indirect_activities, :generator_id
  end
end
