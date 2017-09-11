class AddReferenceIndirecActivity < ActiveRecord::Migration[5.0]
  def change
    add_reference :indirect_activities , :subprocedure , foreign_key: true
  end
end
