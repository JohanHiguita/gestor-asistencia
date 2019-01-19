class AddLastName1ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name_1, :string
  end
end
