class LibraryItemsController < ApplicationController
  def index
    @library_items = LibraryItem.all
  end

  def show
    @library_item = LibraryItem.find(params[:id])
  end
end
