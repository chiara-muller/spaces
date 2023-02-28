class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @user_id = 1
    @booking = Booking.new
    @space = Space.find(params[:space_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @space = Space.find(params[:space_id])
    @user_id = 1
    @booking.user_id = @user_id
    @booking.space = @space
    if @booking.save!
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date_time, :end_date_time, :space_id, :user_id)
  end
end
