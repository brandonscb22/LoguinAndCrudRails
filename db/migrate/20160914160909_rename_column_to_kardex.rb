class RenameColumnToKardex < ActiveRecord::Migration[5.0]
  def change
    remove_column :kardexes, :type, :boolean
    add_column :kardexes, :type_kardex, :boolean
  end
end
