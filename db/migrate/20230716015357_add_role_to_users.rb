class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default: 0
    add_column :users, :name, :string
    add_column :users, :lastName, :string
  end
end
