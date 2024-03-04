class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
    respond_to do |format|
      format.html
      format.json { render json: @movies.to_json(methods: :average_score) }
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie was successfully created."
    else
      render :new
    end
  end

  def create_multiple
    movies_params = JSON.parse(params[:movies])["movies"].map { |movie| ActionController::Parameters.new(movie).permit(:title, :director) }

    created_movies = []
    movies_params.each do |movie_params|
      movie = Movie.new(movie_params)
      if movie.save
        created_movies << movie
      end
    end

    if created_movies.any?
      redirect_to movies_path, notice: "Movies were successfully created."
    else
      render json: { error: "Failed to create movies." }, status: :unprocessable_entity
    end
  end
  
  
  private

  def movie_params
    params.require(:movie).permit(:title, :director)
  end
end
