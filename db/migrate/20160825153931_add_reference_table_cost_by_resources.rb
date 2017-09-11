class AddReferenceTableCostByResources < ActiveRecord::Migration[5.0]
  def change
    add_reference :cost_by_resources, :activity_by_product, foreign_key: true
  end
end
