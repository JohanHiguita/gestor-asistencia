class ChangeSessionToClassSession < ActiveRecord::Migration[5.2]
  def change
  	rename_table :sessions, :class_sessions
  end
end
