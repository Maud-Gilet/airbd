class AlbumsController < ApplicationController
  before_action :set_album, only: [:show]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @user = current_user
    @album = Album.new(album_params)
    @album.user = @user
    @album.save
    redirect_to album_path(@album)
  end

  def show
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:description, :available)
  end
end
