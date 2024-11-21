class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dream
  before_action :set_review, only: %i[edit update destroy]

  def new
    @review = @dream.reviews.new
  end

  def create
    @review = @dream.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to dream_path(@dream), notice: "Review added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to dream_path(@dream), notice: "Review updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @review.user == current_user
      @review.destroy
      redirect_to @dream, notice: "Review deleted"
    end
  end

  private

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end

  def set_review
    @review = @dream.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
