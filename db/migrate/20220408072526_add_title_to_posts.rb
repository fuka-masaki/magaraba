class AddTitleToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :Title, :string
  end
end
