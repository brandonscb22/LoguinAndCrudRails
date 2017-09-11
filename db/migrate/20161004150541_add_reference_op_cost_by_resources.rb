class AddReferenceOpCostByResources < ActiveRecord::Migration[5.0]
  def change
    remove_column :op_cost_by_resources , :production_order_id
    add_reference :op_cost_by_resources , :production_order_identifier, foreign_key: true
  end
end
