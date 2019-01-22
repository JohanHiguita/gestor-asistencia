class CreateJoinTableSessionsStudents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sessions, :students do |t|
      t.references :session, foreign_key: true
      t.references :student, foreign_key: true
    end
  end
end
