class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_type, :integer
    add_column :users, :description, :text
    add_column :users, :address, :string
    add_column :users, :github, :string
    add_column :users, :linkedin, :string
  end
end
