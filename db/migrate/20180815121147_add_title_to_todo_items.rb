class AddTitleToTodoItems < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_items, :title, :string
  end
end
