class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
