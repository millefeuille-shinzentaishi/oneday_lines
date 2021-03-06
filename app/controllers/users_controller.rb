class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[show index]
  /before_action :correct_user, only: %i[edit update]/

  def top

    unless Span.all.empty?
      s_day = Span.first.start_date
      e_day = Span.first.end_date
      @span = []
      (s_day..e_day).each do |date|
        @span.push(date)
      end
      # if Record.where(user_id: current_user.id, day: s_day).empty?
      #     start_record = Record.new(user_id: current_user.id, day: s_day, t_line: 0)
      #     start_record.save
      # end

      User.all.each do |user|
        if Record.where(user_id: user.id, day: s_day).empty?
          a = Record.new(user_id: user.id, day: s_day, t_line: 0)
          a.save
        end
        (s_day..Date.today).each do |d|
          if Record.where(user_id: user.id, day: d).empty?
              a = Record.new(user_id: user.id, day: d, t_line: Record.find_by(user_id: user.id, day: d.yesterday).t_line)
              a.save
            end
          end
        end



      @users_line = []
      User.all.each do |user|
        user_line = []
        Record.where(user_id: user.id, day: s_day..e_day).order(day: "asc").each do |r|
          user_line.push(r.t_line)
        end
        @users_line.push(user_line)
      end
      @chart = LazyHighCharts::HighChart.new("graph") do |c|
        c.xAxis(categories: @span)
        c.yAxis(title: {text: "行数"})
        User.all.each_with_index() do |user, i|
        c.series(name: user.name, data: @users_line[i])
        end
      end
    end

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
