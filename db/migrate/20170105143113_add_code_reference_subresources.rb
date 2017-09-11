class AddCodeReferenceSubresources < ActiveRecord::Migration[5.0]
  def change
    add_column :subresources , :reference , :string
  end
end
