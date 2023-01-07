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
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    @genre = Genre.find_by(id: params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "genre was successfully updated."
      redirect_to admin_genres_path
    else
      @genre = Genre.find_by(id: params[:id])
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
