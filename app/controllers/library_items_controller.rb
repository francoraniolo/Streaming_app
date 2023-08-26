class LibraryItemsController < ApplicationController
  def index
    @library_items = user.library_items.order(:created_at)
    render json: @library_items, each_serializer: LibraryItemSerializer
  end

  def show
    @library_item = LibraryItem.find(params[:id])
  end

  def user
    @user = User.find(params[:user_id])
  end
end
