class RemoveDateFromSessions < ActiveRecord::Migration[5.2]
  def change
    remove_column :sessions, :date, :date
  end
end
