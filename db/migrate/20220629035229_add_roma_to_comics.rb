class AddRomaToComics < ActiveRecord::Migration[6.1]
  def change
    add_column :comics, :roma, :string
  end
end
