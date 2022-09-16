class AddKanbanToPosition < ActiveRecord::Migration[6.1]
  def change
    add_column :kanbans, :position, :integer
  end
end
