class AddInProgressToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :in_progress, :boolean
  end
end
