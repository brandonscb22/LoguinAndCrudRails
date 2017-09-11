class AddColumnsOrderProduction < ActiveRecord::Migration[5.0]
  def change
    add_reference :production_orders , :production_order_identifier , foreign_key: true
  end
end
