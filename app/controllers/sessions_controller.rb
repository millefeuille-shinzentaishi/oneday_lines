class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      log_in user
      if user.admin = true
        redirect_to "/admin"
      else
        redirect_to user
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
