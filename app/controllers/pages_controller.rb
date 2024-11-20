class PagesController < ApplicationController
  def home
  end

  def profile
    @user = current_user
    @created_dreams = @user.dreams
    @bookings = @user.bookings
  end

  def create
    @user = current_user

    respond_to do |format|

        format.html { redirect_to profile_path }
        format.json # Follows the classic Rails flow and look for a create.json view
    end
  end
end
