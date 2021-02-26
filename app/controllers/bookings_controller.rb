class BookingsController < ApplicationController
  def index
    bookings = Booking.all
    @user_bookings = bookings.select { |booking| booking.user_id == current_user.id && booking.confirmed }
    @workspace = Workspace.where(user_id: current_user.id)
    @workspace_bookings = bookings.select { |booking| booking.workspace.user == current_user }
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
    @booking.workspace = Workspace.find(params[:workspace_id])
    @booking.user = current_user
    if @booking.save!
      flash[:notice] = "Your booking is confirmed"
      redirect_to user_path(@booking.user)
    else
      render "workspaces/show"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      @booking.confirmed = false
      @booking.save
      redirect_to workspace_booking_path(@venue, @booking)
    else
      render :edit
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.toggle!(:confirmed)
    redirect_to workspace_path(@booking.workspace, @booking)
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.toggle!(:confirmed)
    redirect_to workspace_path(@booking.workspace, @booking)
  end
  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :person_count, :price)
  end
end
