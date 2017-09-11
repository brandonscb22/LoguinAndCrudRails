class AddColumnsIndirectActivityCount < ActiveRecord::Migration[5.0]
  def change
    add_column :indirect_activities , :management_unit_quanity , :decimal
  end
end
