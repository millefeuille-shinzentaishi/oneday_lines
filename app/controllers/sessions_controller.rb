class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      log_in user
      if user.admin == true
        redirect_to "/admin"
      else
        redirect_to user, success: "ログイン成功！"
      end
    else
      redirect_to login_path, danger: "ID／パスワードが違います"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
