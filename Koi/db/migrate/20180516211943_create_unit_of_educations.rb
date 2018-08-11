class CreateUnitOfEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :unit_of_educations do |t|
      t.string :title
      t.string :description, default: ''
      t.integer :points
      t.datetime :completed_at

      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
