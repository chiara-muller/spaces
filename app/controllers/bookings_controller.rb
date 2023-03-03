class BookingsController < ApplicationController
  def index
    @user_id = 1
    @bookings = Booking.where(user_id: @user_id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @space = Space.find(params[:space_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @space = Space.find(params[:space_id])
    @booking.space = @space
    @booking.user = current_user
    if @booking.save
      flash[:success]
      redirect_to my_bookings_path, status: :see_other
    else
      flash[:error] = @booking.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def all_my_bookings
    @bookings = Booking.where(user: current_user)
  end

  def show_my_bookings
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path, status: :see_other
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to my_bookings_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date_time, :end_date_time, :space_id, :user_id)
  end
end
