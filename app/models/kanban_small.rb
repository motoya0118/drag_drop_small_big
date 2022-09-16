class KanbanSmall < ApplicationRecord
  has_many :cards
  belongs_to :kanban_big
end
