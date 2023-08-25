class LibraryItemsController < ApplicationController
  def index
    @library_items = 
  end

  def show
    @library_item = LibraryItem.find(params[:id])
  end

  def user
   @user = User.find(params[:user])
  end
end
