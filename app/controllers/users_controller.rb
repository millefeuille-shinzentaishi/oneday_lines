class UsersController < ApplicationController
  def top

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user.id)
    else
      render new
    end
  end

  def show
    @user = User.find(params[:id])
    @folders = @user.folders
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
