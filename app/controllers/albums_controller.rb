class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update]

  def index
    @albums = Album.all
    # Scope from Authorization
    # @albums = policy_scope(Album)
  end

  def show
  end

  def new
    @album = Album.new
    authorize @album
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    authorize @album
    @album.save
    if @album.save
      redirect_to album_path(@album), notice: 'Votre album a bien été créé.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @album.update(album_params)
    if @album.update(album_params)
      redirect_to album_path(@album), notice: 'Votre album a bien été mis à jour.'
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
