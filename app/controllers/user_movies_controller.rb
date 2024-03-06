class UserMoviesController < ApplicationController
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:user_movie][:movie_id])
    current_user.movies << @movie
    @user_movie = current_user.user_movies.find_by(movie_id: @movie.id)
    @user_movie.update(score: params[:user_movie][:score])
    redirect_to movies_path
  end

  def update
    @user_movie = current_user.user_movies.find_by(movie_id: params[:user_movie][:movie_id])
    @user_movie.update(score: params[:user_movie][:score])
    redirect_to movies_path
  end
  
  def update_scores
    if params[:user_movies].present?
      json_data = JSON.parse(params[:user_movies])
      
      json_data.each do |user_movie|
        movie_id = user_movie["movie_id"]
        score = user_movie["score"]
      
        user_movie_record = current_user.user_movies.find_or_create_by(movie_id: movie_id)
     
        if user_movie_record
          user_movie_record.update(score: score)
          puts "Updated movie_id #{movie_id} with score #{score}"
        else
          puts "Movie not found for movie_id #{movie_id}"
        end
      end
      redirect_to movies_path
    end
  end
end
