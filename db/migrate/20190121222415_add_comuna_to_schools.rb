class AddComunaToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :comuna, :integer
  end
end
