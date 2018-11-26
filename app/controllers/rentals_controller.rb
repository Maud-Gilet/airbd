class RentalsController < ApplicationController
  before_action :set_rental, only: [:show]

  def create
    @user = current_user
    @rental = Rental.new(album_id: params[:album_id], borrower_id: @user)
    @rental.save
    @rental.album.available = false
    redirect_to album_rental_path(@rental)
  end

  def show
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
