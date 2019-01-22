class AddObservationsToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :observations, :text
  end
end
