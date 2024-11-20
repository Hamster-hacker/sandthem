class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dream

  def new
    @booking = @dream.bookings.new
  end

  def create
    @booking = @dream.bookings.new(booking_params)
    @booking.user_id = current_user.id

    if params[:booking][:start_date].present?
      date_range = params[:booking][:start_date].split(" to ")
      @booking.start_date = date_range[0]
      @booking.end_date = date_range[1] || date_range[0]
      days = (@booking.end_date - @booking.start_date).to_i + 1
      price = days * @dream.price.to_f
      price = price.round(5)
    
    end

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
    params.require(:booking).permit(:dream_id, :start_date, :end_date)
  end
end
