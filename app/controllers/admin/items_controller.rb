class Admin::ItemsController < ApplicationController
  def index

  end

  def show
   @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to admin_item_path(@item)
    else
      redirect_to new_admin_item_path
    end
  end

  def edit
  end


  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :item_detail, :price_without_tax, :item_image, :is_sale_status)
  end
end
