class UsersController < ApplicationController
  def show
    selection = params[:keyword]
    @tasks = Task.sort(selection)
    @all_task = Task.all
  end

  def edit
  end
end
