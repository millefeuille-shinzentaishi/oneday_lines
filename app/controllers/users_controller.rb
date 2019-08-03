class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[show index]
  /before_action :correct_user, only: %i[edit update]/

  def top
    @records =Record.all.order(:create_at)
  end

  def index
    @users = User.all
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
    span = Span.first
    span.destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  def all_destroy
    users = User.all
    users.each do |user|
      unless user.admin
        user.destroy
      end
    end
    redirect_to admin_path, success: "初期化完了！"
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def correct_user
    user = User.find(params[:id])
    return if user == current_user

    redirect_to root_path, danger: "アカウントが違います"
  end
end
