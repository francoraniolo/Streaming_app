class ProductsController < ApplicationController
  def index
    @products = (Movie.all + Season.all).sort_by(&:created_at)
    render json: @products, each_serializer: ProductSerializer
  end
end
