class ProductsController < ApplicationController
  def index
    @products = Rails.cache.fetch(cache_key, expires_in: 1.day) do
      (Movie.all + Season.all).sort_by(&:created_at)
    end

    render json: @products, each_serializer: ProductSerializer
  end

  def cache_key
    cache_key = 'products_' + (Movie.maximum(:updated_at) || 'none') + '_' + (Season.maximum(:updated_at) || 'none')
  end
end
