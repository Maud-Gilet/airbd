class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
    p params
    p params[:comic_id]
    p params[:comic_id].nil?
    @album.comic = Comic.find(params[:comic_id]) unless params[:comic_id].nil?
  end

  def create
    @user = current_user
    @album = Album.new(album_params)
    @album.user = @user
    @album.save
    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @album.update(album_params)
    redirect_to album_path(@album)
  end

  def show
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:description, :available, :comic_id)
  end
end
