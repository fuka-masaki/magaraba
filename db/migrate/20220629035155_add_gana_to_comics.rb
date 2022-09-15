class AddGanaToComics < ActiveRecord::Migration[6.1]
  def change
    add_column :comics, :gana, :string
  end
end
