class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
    @space.update(space_params)
    redirect_to space_path(@space)
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to spaces_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :address, :price, :photo)
  end
end
