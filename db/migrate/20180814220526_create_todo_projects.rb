class CreateTodoProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_projects do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
