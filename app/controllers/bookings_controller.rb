class BookingsController < ApplicationController
  before_action :set_dream

  def new
    @booking = @dream.bookings.new
  end

  def create
    @booking = @dream.bookings.new
    @booking.user_id = current_user.id

    if @booking.save
      redirect_to dream_path(@dream), notice: 'This booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end

  def booking_params
    # params.require(:booking).permit(current_user, :dream_id)
  end
end
