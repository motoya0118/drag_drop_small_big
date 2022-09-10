class KanbanBig < ApplicationRecord
  acts_as_list

  has_many :kanban_smalls, ->{ order(position: :asc) }, dependent: :destroy
  belongs_to :kanban
  scope :sorted, ->{ order(position: :asc) }
end