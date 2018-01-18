class AddFirstLastNames < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :last_name, :string, first: true 
  	add_column :users, :first_name, :string, first: true
  end
end
