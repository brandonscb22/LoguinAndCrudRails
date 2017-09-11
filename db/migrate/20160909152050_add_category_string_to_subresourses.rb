class AddCategoryStringToSubresourses < ActiveRecord::Migration[5.0]
  def change
    add_column :subresources, :category, :string
  end
end
