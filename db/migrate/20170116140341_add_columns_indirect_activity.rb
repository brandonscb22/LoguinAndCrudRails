class AddColumnsIndirectActivity < ActiveRecord::Migration[5.0]
  def change
    add_reference :indirect_activities , :management_unit , foreign_key: true
  end
end
