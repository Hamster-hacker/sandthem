class DreamsController < ApplicationController

  def index
    @dreams = Dream.all
  end


  def new
    @dream = Dream.new

  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user

    if @dream.save
      redirect_to @dream, notice: "dream was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end



  private
  def dream_params
    params.require(:dream).permit(:title, :description, :category, :price, :image_url, :duration, :rating)
  end
end
