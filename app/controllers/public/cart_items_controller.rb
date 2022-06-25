class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items
    @total_payment = @cart_items.sum{|cart_item|cart_item.item.price_without_tax * cart_item.quantity * 1.1}
  end

  def create
    @cart_items = current_customer.cart_items
    if params[:cart_item][:quantity] != ""
       if @cart_items.any? {|cart_item|cart_item.item_id == params[:cart_item][:item_id].to_i}
        @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id].to_i)
        @cart_item.quantity += params[:cart_item][:quantity].to_i
        @cart_item.save
        redirect_to cart_items_path
       else
        @cart_item = CartItem.new(
          quantity: params[:cart_item][:quantity].to_i,
          item_id: params[:cart_item][:item_id].to_i,
          customer_id: current_customer.id
          )
          @cart_item.save
          redirect_to cart_items_path
       end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    @cart_items = current_customer.cart_items
    @total_payment = @cart_items.sum{|cart_item|cart_item.item.price_without_tax * cart_item.quantity * 1.1}
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
  end
end
