class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
