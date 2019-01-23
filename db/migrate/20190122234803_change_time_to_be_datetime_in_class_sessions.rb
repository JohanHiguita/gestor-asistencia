class ChangeTimeToBeDatetimeInClassSessions < ActiveRecord::Migration[5.2]

  def change
  	change_column :class_sessions, :time, :datetime
  end

end
