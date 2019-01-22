class RemoveStudentIdFromSessions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sessions, :student_id, index: true, foreign_key: true
    remove_column :sessions, :index_sessions_on_student_id
  end
end
