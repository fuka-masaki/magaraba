class AddKanaToComics < ActiveRecord::Migration[6.1]
  def change
    add_column :comics, :kana, :string
  end
end
