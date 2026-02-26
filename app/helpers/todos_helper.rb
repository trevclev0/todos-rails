module TodosHelper
  def format_todo_status(todo)
    todo.completed? ? "☑ Completed" : "☐ Incomplete"
  end
end
