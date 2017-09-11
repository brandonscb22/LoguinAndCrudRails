class UsersController < ApplicationController
  def new
    @user = User.new
    render layout: false
  end
  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to root_path
    else
      render "new"
    end
  end
  private
  def users_params
    params.require(:user).permit(:username,:email,:password)
  end
end
