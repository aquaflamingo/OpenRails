class AddCompletedAtToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :completed_at, :date_time
  end
end
