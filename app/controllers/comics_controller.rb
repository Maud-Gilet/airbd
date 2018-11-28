require 'json'
require 'open-uri'

class ComicsController < ApplicationController

  def new
    @comic = Comic.new
  end

  def create
    title_query = comic_params[:title]
    isbn_query = comic_params[:isbn]

    @comic = Comic.new(store_informations(title_query, isbn_query))

    @comic_found = check_doubles(title_query, isbn_query)
    if !@comic_found.nil?
      redirect_to new_album_path(comic_id: @comic_found.id.to_s), notice: "Un correspondance a été trouvée dans la liste"
    elsif store_informations(title_query, isbn_query).nil?
      flash[:alert] = "Veuillez renouveller votre recherche, nous n'avons trouvé aucune correspondance"
      render :new
    elsif @comic.save
      redirect_to new_album_path(comic_id: @comic.id.to_s), notice: "#{@comic.title} est disponible"
    else
      render :new
    end
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :author, :artwork, :category, :isbn)
  end

  def check_doubles(title_query, isbn_query)
    # Check if the result of the search raises matches in our DB
    sql_query = " title ILIKE :title_query OR isbn = :isbn_query "
    @comics = Comic.where(sql_query, title_query: title_query.to_s, isbn_query: isbn_query.to_s)
    return @comics.first unless @comics.empty?
  end

  def request_informations_from_api(title_query, isbn_query)
    url_api = 'https://www.googleapis.com/books/v1/volumes?q='
    url = "#{url_api}#{title_query}+isbn:#{isbn_query}&key=#{ENV['GOOGLE_API_KEY']}"
    response = open(url).read
    return JSON.parse(response)
  end

  def store_informations(title_query, isbn_query)
    # Check if the search returns informations
    informations_raw = request_informations_from_api(title_query, isbn_query)
    return nil if informations_raw['totalItems'].zero?

    # Store informations from API call
    title = informations_raw['items'][0]['volumeInfo']['title']
    author = informations_raw['items'][0]['volumeInfo']['authors'][0] unless informations_raw['items'][0]['volumeInfo']['authors'].nil?
    isbn = informations_raw['items'][0]['volumeInfo']['industryIdentifiers'][0]['identifier'] unless informations_raw['items'][0]['volumeInfo']['industryIdentifiers'].nil?
    artwork = informations_raw['items'][0]['volumeInfo']['imageLinks']['smallThumbnail'] unless informations_raw['items'][0]['volumeInfo']['imageLinks'].nil?
    return { title: title, author: author, artwork: artwork, isbn: isbn }
  end
end
