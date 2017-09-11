class ErrorDeVictor < ActiveRecord::Migration[5.0]
  def change
    remove_column :subresources, :unity, :integer
    add_reference :subresources, :meter, foreign_key: true
  end
end
