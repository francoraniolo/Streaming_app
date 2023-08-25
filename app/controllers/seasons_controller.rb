class SeasonsController < ApplicationController
  def index
    @seasons = Season.order(created_at: :asc)
    render json: @seasons, each_serializer: SeasonSerializer
  end

  def show
    @season = Season.find(params[:id])
    render json: @season, serializer: SeasonSerializer
  end
end
