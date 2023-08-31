class ProductsController < ApplicationController
  def index
    @products = Rails.cache.fetch(cache_key, expires_in: 1.day) do
      (Movie.all + Season.all).sort_by(&:created_at)
    end

    render json: @products, each_serializer: ProductSerializer
  end

  def cache_key
    movie_updated_at = Movie.maximum(:updated_at)&.to_s || 'none'
    season_updated_at = Season.maximum(:updated_at)&.to_s || 'none'
    cache_key = 'products_' + movie_updated_at + '_' + season_updated_at
  end
end
