class AddTelToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :tel, :bigint
  end
end
