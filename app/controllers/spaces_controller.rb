class SpacesController < ApplicationController
  def index
    @spaces = Space.all
    if params[:query].present?
      sql_query = <<~SQL
        spaces.title @@ :query
        OR spaces.space_type @@ :query
      SQL
      @spaces = Space.where(sql_query, query: "%#{params[:query]}%")
    else
      @spaces = Space.all
    end
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new
  end

  def new
    @user_id = current_user
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    if @space.save
      redirect_to confirm_listing_path(@space)
    else
      render :new
    end
  end

  def edit
    @space = Space.find(params[:id])
  end

  def confirm_listing
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
    @space.update(space_params)
    redirect_to confirm_listing_path(@space)
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to spaces_path, status: :see_other
  end

  private

  def space_params
    params.require(:space).permit(:title, :address, :capacity, :space_type, :price, :user_id, photos: [])
  end
end
