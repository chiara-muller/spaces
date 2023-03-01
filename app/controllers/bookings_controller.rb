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
    if @booking.save
      flash[:success]
      redirect_to my_bookings_show_path(@booking)
    else
      flash[:error] = @booking.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def all_my_bookings
    @user_id = 1
    @bookings = Booking.where(user_id: @user_id)
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
    redirect_to my_bookings_show_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date_time, :end_date_time, :space_id, :user_id)
  end
end
