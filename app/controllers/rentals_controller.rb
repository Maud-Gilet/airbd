class RentalsController < ApplicationController

  def create
    @album = Album.find(params[:album_id])
    @request = @album.requests.first
    @rental = Rental.new(rented: true, album_id: @album.id, user_id: @request.user.id)
    if @rental.save
      @request.destroy
      redirect_to current_user_dashboard_path
    end
    authorize @rental
  end

  def destroy
    @rental = Rental.find(params[:id])
    if @rental.destroy
      redirect_to current_user_dashboard_path, notice: "La BD est de retour chez vous !"
    end
    authorize @rental
  end
end
