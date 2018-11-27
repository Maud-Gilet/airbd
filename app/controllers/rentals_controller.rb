class RentalsController < ApplicationController
  before_action :set_rental, only: [:show]

  def new
    @rental = Rental.new
  end

  def create
    @album = Album.find(params[:album_id])
    @lender = @album.user
    @rental = Rental.new(lender_id: @lender.id, rented: true, album_id: @album.id, borrower_id: current_user.id)
    @rental.save
    @album.update(available: false)
    redirect_to album_rental_path(@album, @rental)
  end

  def show
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
