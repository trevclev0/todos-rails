class TodosController < ApplicationController
  before_action :require_login
  before_action :set_todo, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @todos = current_user.todos
  end

  def show; end

  def edit; end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.create(todo_params)
    if @todo.save
      redirect_to @todo, notice: "Todo created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: "Todo updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path, notice: "Todo deleted."
  end

  private

  def handle_not_found
    redirect_to todos_path, alert: "Todo not found."
  end

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description)
  end
end
