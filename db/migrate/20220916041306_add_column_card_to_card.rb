class AddColumnCardToCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :edit, :boolean , null: false, default: false
  end
end
