class AddWeekToClassSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :class_sessions, :week, :integer
  end
end
