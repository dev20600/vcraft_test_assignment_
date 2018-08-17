json.extract! todo_project, :id, :title, :description, :created_at, :updated_at
json.url todo_project_url(todo_project, format: :json)
