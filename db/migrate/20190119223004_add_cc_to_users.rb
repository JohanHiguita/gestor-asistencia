class AddCcToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cc, :string
  end
end
