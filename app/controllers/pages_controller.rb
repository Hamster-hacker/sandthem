# rubocop:disable Layout/MultilineMethodCallIndentation
class PagesController < ApplicationController
  def home
  end

  def profile
    @user = current_user
    @created_dreams = @user.dreams
    @bookings = @user.bookings

    @sales = Booking.joins(:dream)
    .where.not(user_id: current_user.id)
    .where(dreams: { user_id: current_user.id })
    .includes(:user, :dream)
  end

  def create
    @user = current_user

    respond_to do |format|
        format.html { redirect_to profile_path }
        format.json
    end
  end
end
# rubocop:enable Layout/MultilineMethodCallIndentation
