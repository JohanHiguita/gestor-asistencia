class AddLevelToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :level, :integer
  end
end
