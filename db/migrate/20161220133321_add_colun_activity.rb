class AddColunActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities , :quantity_generator , :string
  end
end
