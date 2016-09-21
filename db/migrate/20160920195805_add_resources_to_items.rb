class AddResourcesToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :resources, :text
  end
end
