class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
    @workspace = Workspace.find(params[:workspace_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
    @workspace = Workspace.find(params[:workspace_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.workspace_id = params[:workspace_id]
    @booking.user_id = current_user.id
    if @booking.save!
      flash[:notice] = "Your booking is confirmed"
      redirect_to user_path(current_user)
    else
      render "workspaces/show"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to workspace_path(@booking.workspace)
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :person_count, :price)
  end
end
