class AddConstraintsToTodoUserIdColumn < ActiveRecord::Migration[8.1]
  def change
    change_column_null :todos, :user_id, false
    add_foreign_key :todos, :users, on_delete: :cascade
  end
end
