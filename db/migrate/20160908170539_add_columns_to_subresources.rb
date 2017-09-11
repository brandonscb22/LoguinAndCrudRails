class AddColumnsToSubresources < ActiveRecord::Migration[5.0]
  def change
    add_column :subresources, :identity_card, :string
    add_column :subresources, :unity, :integer
    add_column :subresources, :salary, :decimal
    add_column :subresources, :hours_worked, :decimal
    add_column :subresources, :value_hour, :decimal
    add_column :subresources, :unit_cost, :decimal
    add_column :subresources, :stock_minimum, :decimal
    add_column :subresources, :stock_maximum, :decimal
    add_column :subresources, :current_stock, :decimal
    add_column :subresources, :identifier, :string
    add_column :subresources, :useful_life, :decimal
    add_column :subresources, :market_valuer, :float
  end
end
