class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :number
      t.date :date
      t.time :datetime
      t.references :user, foreign_key: true
      t.references :school, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
