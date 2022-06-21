class Public::ItemsController < ApplicationController
  def index
    @search = Item.ransack(params[:q])
    @items = @search.result.page(params[:page]).per(6)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
