class AddContentToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :content, :string
  end
end
