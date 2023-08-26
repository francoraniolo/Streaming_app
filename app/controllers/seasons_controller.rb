class SeasonsController < ApplicationController
  def index
    @seasons = Rails.cache.fetch(Season.cache_key, expires_in: 1.day) do
      Season.order(created_at: :asc)
    end
    render json: @seasons, each_serializer: SeasonSerializer
  end

  def show
    @season = Season.find(params[:id])
    render json: @season, serializer: SeasonSerializer
  end
end
