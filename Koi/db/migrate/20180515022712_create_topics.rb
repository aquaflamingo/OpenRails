class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :description
      t.integer :max_units
      t.datetime :complete_date, :null => true

      t.timestamps
    end
  end
end
