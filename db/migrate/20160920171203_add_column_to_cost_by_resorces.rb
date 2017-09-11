class AddColumnToCostByResorces < ActiveRecord::Migration[5.0]
  def change
    add_column :cost_by_resources , :cost , :decimal
  end
end
