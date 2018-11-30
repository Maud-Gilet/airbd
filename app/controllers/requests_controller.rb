class RequestsController < ApplicationController
  def create
    @request = Request.new(album_id: params[:album_id], user_id: current_user.id, status: true)
    if @request.save
      redirect_to current_user_dashboard_path, notice: 'Votre demande a bien été envoyée.'
    end
    authorize @request
  end

  def destroy
    @request = Request.find(params[:id])
    if @request.destroy
      redirect_to current_user_dashboard_path, notice: 'Votre demande a bien été annulée.'
    end
    authorize @request
  end
end
