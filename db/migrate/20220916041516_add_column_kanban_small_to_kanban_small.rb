class AddColumnKanbanSmallToKanbanSmall < ActiveRecord::Migration[6.1]
  def change
    add_column :kanban_smalls, :edit, :boolean, null: false, default: false
  end
end
