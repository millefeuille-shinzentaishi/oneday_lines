class CodesController < ApplicationController

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)
    @code.line = @code.content.lines.count
    @code.folder_id = params[:folder_id]
    if @code.save
      redirect_to root_path
    else
      render new
    end
  end






  private

  def code_params
    params.require(:code).permit(:name, :content)
  end
end
