class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    selection = params[:keyword]
    @tasks = Task.sort(selection)
    @all_task = Task.all
    redirect_to user_path(current_user) unless @user == current_user
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
