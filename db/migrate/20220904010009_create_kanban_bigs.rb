class CreateKanbanBigs < ActiveRecord::Migration[6.1]
  def change
    create_table :kanban_bigs do |t|
      t.string :name
      t.references :kanban, null: false, foreign_key: true

      t.timestamps
    end
  end
end
