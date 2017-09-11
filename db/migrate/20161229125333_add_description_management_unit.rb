class AddDescriptionManagementUnit < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities , :quantity_generator
    add_column :management_units , :description, :string
  end
end
