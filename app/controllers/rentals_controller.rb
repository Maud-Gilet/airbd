class RentalsController < ApplicationController
  before_action :set_rental, only: [:show]

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rented: true, album_id: params[:album_id], borrower_id: current_user.id)
    @rental.save
    @rental.album.available = false
    @album = @rental.album
    redirect_to album_rental_path(@rental)
  end

  def show
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
