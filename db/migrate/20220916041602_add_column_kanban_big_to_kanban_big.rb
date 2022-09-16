class AddColumnKanbanBigToKanbanBig < ActiveRecord::Migration[6.1]
  def change
    add_column :kanban_bigs, :edit, :boolean , null: false, default: false
  end
end
