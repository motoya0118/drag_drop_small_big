class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :content
      t.integer :position
      t.references :kanban_small, null: false, foreign_key: true

      t.timestamps
    end
  end
end
