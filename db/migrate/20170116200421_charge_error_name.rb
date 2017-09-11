class ChargeErrorName < ActiveRecord::Migration[5.0]
  def change
    remove_column :indirect_activities , :management_unit_quanity
    add_column :indirect_activities , :management_unit_quantity , :decimal
  end
end
