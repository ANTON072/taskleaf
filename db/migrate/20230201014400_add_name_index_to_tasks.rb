class AddNameIndexToTasks < ActiveRecord::Migration[7.0]
  def change
    add_index :tasks, :name, unique: true
  end
end
