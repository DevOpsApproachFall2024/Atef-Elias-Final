class TasksController < ApplicationController
  before_action :authorize_request
  before_action :set_task, only: [ :show, :update, :destroy ]

  def index
    tasks = current_user.tasks
    render json: tasks, status: :ok
  end

  def create
    task = current_user.tasks.build(task_params)

    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @task, status: :ok
  end

  def update
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    render json: { message: "Task deleted successfully" }, status: :ok
  end

  private

  def set_task
    @task = current_user.tasks.find_by(id: params[:id])
    render json: { errors: "Task not found" }, status: :not_found unless @task
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
