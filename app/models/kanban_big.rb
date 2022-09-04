class KanbanBig < ApplicationRecord
  has_many :kanban_smalls
  belongs_to :kanban
end
