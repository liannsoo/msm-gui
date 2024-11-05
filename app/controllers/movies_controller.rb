class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_movie = Movie.find(the_id)

    render({ :template => "movie_templates/show" })
  end

  def new
    @movie = Movie.new
    render({ :template => "movie_templates/new" })
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to("/movies")
    else
      render({ :template => "movie_templates/new" })
    end
  end

  def edit
    @movie = Movie.find(params[:path_id])
    render({ :template => "movie_templates/edit" })
  end

  def update
    @movie = Movie.find(params[:path_id])
    if @movie.update(movie_params)
      redirect_to(movie_path(@movie))
    else
      render({ :template => "movie_templates/edit" })
    end
  end

  def destroy
    @movie = Movie.find(params[:path_id])
    @movie.destroy
    redirect_to("/movies")
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :duration, :description, :image, :director_id)
  end
end
