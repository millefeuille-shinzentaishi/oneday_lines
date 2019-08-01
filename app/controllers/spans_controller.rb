class SpansController < ApplicationController
  def new
    @span = Span.new
  end

  def create
    @span = Span.new(span_params)
    if @span.save
      redirect_to admin_path
    else
      render :new
    end
  end

  def destroy
    Span.first.destroy
    redirect_to admin_path
  end


  private
    def span_params
      params.require(:span).permit(:start_date, :end_date)
    end
end
