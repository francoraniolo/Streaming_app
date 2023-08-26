class MoviesController < ApplicationController
  def index
    movie_cache_key = Movie.cache_key

    @movies = Rails.cache.fetch(movie_cache_key, expires_in: 1.day) do
      Movie.order(created_at: :asc)
    end
    render json: @movies, each_serializer: MovieSerializer
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie, serializer: MovieSerializer
  end
end
