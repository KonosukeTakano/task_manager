class TasksController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to users_path
  end

  private

  def task_params
    params.require(:task).permit(:body, :due, :status, :reminder_active)
  end

  def ensure_correct_user
    task = Task.find(params[:id])
    redirect_to users_path unless current_user == task.user
  end
end
