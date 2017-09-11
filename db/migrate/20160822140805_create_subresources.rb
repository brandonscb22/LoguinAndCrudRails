class CreateSubresources < ActiveRecord::Migration[5.0]
  def change
    create_table :subresources do |t|
      t.string :name
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end
