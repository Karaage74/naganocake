class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @search = Item.ransack(params[:q])
    @items = @search.result.page(params[:page]).per(6)
    @items_all = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
    @item_comment = ItemComment.new
  end
  
  
end
