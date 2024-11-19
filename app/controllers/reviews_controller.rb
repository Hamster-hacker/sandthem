class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dream

  def new
    @review = @dream.reviews.new
  end

  def create
    @review = @dream.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to dream_path(@dream), notice: "Review added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
