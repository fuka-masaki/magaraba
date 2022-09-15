class AddPostCountToComics < ActiveRecord::Migration[6.1]
  def change
    add_column :comics, :post_count, :integer
  end
end
