class AddTaskIdToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :task_id, :integer
  end
end
