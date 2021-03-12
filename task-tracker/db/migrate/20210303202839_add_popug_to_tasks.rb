class AddPopugToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :popug_id, :string
  end
end
