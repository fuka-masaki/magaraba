class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :comic1, :string
    add_column :users, :comic2, :string
    add_column :users, :comic3, :string
    add_column :users, :read, :string
  end
end
