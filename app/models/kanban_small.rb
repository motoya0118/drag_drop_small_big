class KanbanSmall < ApplicationRecord
  acts_as_list
  has_many :cards, ->{ order(position: :asc) }, dependent: :destroy
  belongs_to :kanban_big
end
