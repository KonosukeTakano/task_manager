class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

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

  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      redirect_to users_path, notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
