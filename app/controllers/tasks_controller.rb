class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.user_id = current_user.id
    task.save
    redirect_to user_path(current_user)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to user_path(current_user)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to user_path(current_user)
  end

  private

  def task_params
    params.require(:task).permit(:body, :due, :status)
  end

end
