module TodosHelper
  def format_todo_status(todo)
    todo.completed? ? "☑ Completed" : "☐ Incomplete"
  end

  def todo_form_title(todo)
    todo.new_record? ? "New Todo" : "Edit Todo"
  end
end
