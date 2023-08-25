class MoviesController < ApplicationController
  def index
    @movies = Movie.order(created_at: :asc)
    render json: @movies, each_serializer: MovieSerializer
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie, serializer: MovieSerializer
  end
end
