class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre= Genre.new(genre_params)

    if @genre.save
      flash[:notice] = "genre was successfully created."
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
