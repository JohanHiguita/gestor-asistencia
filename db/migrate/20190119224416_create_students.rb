class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name_1
      t.string :last_name_2
      t.string :cc
      t.integer :grade
      t.integer :age
      t.string :gender
      t.references :user, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
