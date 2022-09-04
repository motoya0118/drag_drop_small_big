class CreateKanbanSmalls < ActiveRecord::Migration[6.1]
  def change
    create_table :kanban_smalls do |t|
      t.string :name
      t.references :kanban_big, null: false, foreign_key: true

      t.timestamps
    end
  end
end
