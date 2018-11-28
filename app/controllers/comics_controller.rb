require 'json'
require 'open-uri'

class ComicsController < ApplicationController

  def new
    @comic = Comic.new
  end

  def create
    title_query = comic_params[:title]
    isbn_query = comic_params[:isbn]

    @comic = Comic.new(request_informations(title_query, isbn_query))
    if @comic.save
      redirect_to new_album_path(comic_id: "#{@comic.id}"), notice: "#{@comic.title} a bien été créé."
    else
      render :new
    end
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :author, :artwork, :category, :isbn)
  end

  def api_url(title_query, isbn_query)
    api_key = 'AIzaSyCE2I7XkcStaYjq5CGZc0uqyGafVhQkpH4'
    url_raw = 'https://www.googleapis.com/books/v1/volumes?q='

    query_title = title_query
    query_isbn = isbn_query

    "#{url_raw}#{query_title}+isbn:#{query_isbn}&key=#{api_key}"
  end

  def request_informations(title_query, isbn_query)
    url = api_url(title_query, isbn_query)
    response = open(url).read
    informations_raw = JSON.parse(response)

    title = informations_raw['items'][0]['volumeInfo']['title']
    author = informations_raw['items'][0]['volumeInfo']['authors'][0] unless informations_raw['items'][0]['volumeInfo']['authors'].nil?
    isbn = informations_raw['items'][0]['volumeInfo']['industryIdentifiers'][0]['identifier']
    artwork = informations_raw['items'][0]['volumeInfo']['imageLinks']['smallThumbnail'] unless informations_raw['items'][0]['volumeInfo']['imageLinks'].nil?
    return { title: title, author: author, artwork: artwork, isbn: isbn }
  end
end
