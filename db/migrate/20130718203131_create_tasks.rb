class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.references :instruction

      t.timestamps
    end
    add_index :tasks, :instruction_id
  end
end
