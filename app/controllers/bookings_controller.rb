class BookingsController < ApplicationController
  def index
    bookings = Booking.all
    @user_bookings = bookings.select { |booking| booking.user_id == current_user.id && booking.confirmed }
    @workspace = Workspace.where(user_id: current_user.id)
    @workspace_bookings = bookings.select { |booking| booking.workspace.user == current_user }
  end

  def new
    @booking = Booking.new(booking_params)
    @workspace.booking = Workspace.find(params[:workspace_id])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @workspace = Workspace.find(params[:workspace_id])
    @booking = Booking.find(params[:id])
  end

  def create
    @workspace = Workspace.find(params[:workspace_id])
    @booking = Booking.new(booking_params)
    @booking.workspace = @workspace
    @booking.user = current_user
    if @booking.save!
      flash[:notice] = "Your booking is confirmed"
      redirect_to user_path(@booking.user)
    else
      render "workspaces/show"
    end
  end

  def update
    @workspace = Workspace.find(params[:workspace_id])
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      @booking.confirmed = false
      @booking.save
      redirect_to workspace_booking_path(@workspace, @booking)
    else
      render :edit
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.toggle!(:confirmed)
    redirect_to bookings_path(@booking.user)
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.toggle!(:confirmed)
    redirect_to bookings_path(@booking.user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :person_count, :price)
  end
end
