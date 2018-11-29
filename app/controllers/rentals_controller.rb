class RentalsController < ApplicationController
  before_action :set_rental, only: [:show]

  def new
    @rental = Rental.new
    authorize @rental
  end

  def create
    @album = Album.find(params[:album_id])
    @rental = Rental.new(rented: true, album_id: @album.id, user_id: current_user.id)
    @rental.save
    if @rental.save
      redirect_to album_rental_path(@album, @rental)
    else
      render :new
    end
  end

  def show
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
    authorize @rental
  end
end
