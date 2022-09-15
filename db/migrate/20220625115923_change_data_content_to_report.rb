class ChangeDataContentToReport < ActiveRecord::Migration[6.1]
  def change
    change_column :reports, :content, :text
  end
end
