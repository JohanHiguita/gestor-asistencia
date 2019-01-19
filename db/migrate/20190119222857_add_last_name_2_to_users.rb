class AddLastName2ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name_2, :string
  end
end
