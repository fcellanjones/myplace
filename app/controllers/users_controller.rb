class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
