class DreamsController < ApplicationController
  def index
    @dreams = Dream.all
  end

  def show
    @dream = Dream.find(params[:id])
    @average_rating = @dream.reviews.average(:rating) || 0.0
    @user_review = @dream.reviews.find_by(user_id: current_user.id) if current_user
    if current_user
      @reviews = @dream.reviews.where.not(user_id: current_user.id)
    else
      @reviews = @dream.reviews.all
    end
    @booking = Booking.new
  end

  def new
    @dream = Dream.new
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def update
    @dream = Dream.find(params[:id])

    if @dream.update(dream_params)
      redirect_to dream_path(@dream), notice: "Dream updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user_id = current_user.id

    if @dream.save
      redirect_to @dream, notice: "Dream was created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy
    redirect_to dreams_path, notice: "Dream deleted"
  end

  def user_dreams
    @dreams = current_user.dreams
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :description, :category, :price, :image_url, :duration, :rating)
  end
end
