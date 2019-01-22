class CreateJoinTableClassSessionsStudents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :class_sessions, :students do |t|
      t.references :class_sessions, foreign_key: true
      t.references :student, foreign_key: true
    end
  end
end
