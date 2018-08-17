class CreateTodoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_items do |t|
      t.string :task_content
      t.boolean :is_done
      t.date :implement_before
      t.integer :order_type
      t.references :todo_project, foreign_key: true

      t.timestamps
    end
  end
end
