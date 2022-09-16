class Kanban < ApplicationRecord
  acts_as_list
  has_many :kanban_bigs, ->{ order(position: :asc) }, dependent: :destroy
end
