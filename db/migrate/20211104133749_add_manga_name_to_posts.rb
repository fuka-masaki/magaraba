class AddMangaNameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :Manga_name, :string
  end
end
 
