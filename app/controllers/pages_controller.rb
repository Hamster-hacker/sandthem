class PagesController < ApplicationController
  def home
  end

  def profile
    @user = current_user
    @created_dreams = @user.dreams
    @bookings = @user.bookings
  end
end
