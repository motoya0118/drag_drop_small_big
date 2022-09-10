class AddKanbanBigToPosition < ActiveRecord::Migration[6.1]
  def change
    add_column :kanban_bigs, :position, :integer
  end
end
