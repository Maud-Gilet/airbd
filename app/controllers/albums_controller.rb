class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update]

  def index
    @users = User.where.not(latitude: nil, longitude: nil)
    @albums = policy_scope(Album)
    authorize @albums
    
    @markers = @albums.map do |album|
      {
        lng: album.user.longitude,
        lat: album.user.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { album: album })
      }
   end

  def show
  end

  def new
    @album = Album.new
    @album.comic = Comic.find(params[:comic_id]) unless params[:comic_id].nil?
    authorize @album
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    authorize @album

    if @album.save
      redirect_to current_user_dashboard_path, notice: 'Votre album a bien été créé.'
    else
      render :new
    end
  end

  def edit
    authorize @album
  end

  def update
    authorize @album
    @album.update(album_params)
    if @album.update(album_params)
      redirect_to current_user_dashboard_path, notice: 'Votre album a bien été mis à jour.'
    else
      render :edit
    end
  end

  private

  def set_album
    @album = Album.find(params[:id])
    authorize @album
  end

  def album_params
    params.require(:album).permit(:description, :available, :comic_id)
  end
end
