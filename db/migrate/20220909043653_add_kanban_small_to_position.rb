class AddKanbanSmallToPosition < ActiveRecord::Migration[6.1]
  def change
    add_column :kanban_smalls, :position, :integer
  end
end
