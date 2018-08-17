class AddTodoFileToTodoItems < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_items, :todo_file, :string
  end
end
