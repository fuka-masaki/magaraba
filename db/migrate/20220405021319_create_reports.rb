class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :reporter_id
      t.integer :violator_id
      t.string :kind
      t.string :content

      t.timestamps
    end
  end
end
