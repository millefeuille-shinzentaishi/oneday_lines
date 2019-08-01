class UsersController < ApplicationController
  def top
    @records =Record.all.order(:create_at)
  end

  def index
    @users = User.where(admin: false)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = "pass"
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @folders = @user.folders
  end

  def admin

  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
