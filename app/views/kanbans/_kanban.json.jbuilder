json.extract! kanban, :id, :name, :description, :created_at, :updated_at
json.url kanban_url(kanban, format: :json)
