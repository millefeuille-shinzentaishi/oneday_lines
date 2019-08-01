class CodesController < ApplicationController

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)
    @code.line = @code.content.lines.count
    @code.folder_id = params[:folder_id]
    if @code.save
      records =Record.where(user_id: current_user.id, created_at: Date.today.in_time_zone.all_day)
      if records.empty?
        record = Record.new(user_id: current_user.id, t_line: 0)
      else
        record = records.first
      end
      record.t_line += @code.line
      record.save
      redirect_to folder_path(@code.folder_id)
    else
      render :new
    end
  end

  def show
    @code = Code.find(params[:id])
  end

  def edit
    @code = Code.find(params[:id])
  end

  def update
    code = Code.find(params[:id])
    old_line = code.line
    if code.update(code_params)
      code.line = code.content.lines.count
      code.save
      records =Record.where(user_id: current_user.id, created_at: Date.today.in_time_zone.all_day)
      if records.empty?
        record = Record.new(user_id: current_user.id, t_line: 0)
      else
        record = records.first
      end
      record.t_line += (code.line - old_line)
      record.save
      redirect_to code_path(code)
    else
      render :edit
    end
  end





  private

  def code_params
    params.require(:code).permit(:name, :content)
  end
end
