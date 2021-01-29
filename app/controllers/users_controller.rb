class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
    @bookings = @bookings.sort { |a, b| b.start_time <=> a.start_time }
  end
end
