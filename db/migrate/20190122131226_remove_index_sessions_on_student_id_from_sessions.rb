class RemoveIndexSessionsOnStudentIdFromSessions < ActiveRecord::Migration[5.2]
  def change
    remove_column :sessions, :index_sessions_on_student_id, :index
  end
end
