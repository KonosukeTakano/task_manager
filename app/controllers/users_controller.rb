class UsersController < ApplicationController
  def show
    selection = params[:keyword]
    if selection.nil?
      @tasks = Task.all
    else
      @tasks = Task.sort(selection)
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end
