class FoldersController < ApplicationController
  before_action :authenticate_user

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    @folder.user_id = current_user.id
    if @folder.save
      redirect_to current_user
    else
      render :new
    end
  end

  def show
    @folder = Folder.find(params[:id])
    @codes = Code.where(folder_id: @folder.id)
  end







  private

  def folder_params
    params.require(:folder).permit(:name)
  end
end
