class CreateComics < ActiveRecord::Migration[6.1]
  def change
    create_table :comics do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
