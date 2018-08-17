class AddForeignKeyForTodoItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :todo_items, :todo_project, foreign_key: {on_delete: :cascade}
  end
end
