class AddReferenceActivity < ActiveRecord::Migration[5.0]
  def change
    add_reference :activities , :generator , foreign_key: true
    add_reference :indirect_activities , :generator , foreign_key: true
  end
end
