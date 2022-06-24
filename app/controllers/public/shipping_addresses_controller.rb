class Public::ShippingAddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    #@shipping_addresses = ShippingAddress.all
    @shipping_addresses = current_customer.shipping_addresses
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    #@shipping_address = current_customer.shipping_addresses
    @shipping_address.save
    binding.pry
    flash[:notice] = "新規配送先を登録しました"
    redirect_to shipping_addresses_path
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      flash[:notice] = "配送先内容を変更しました"
      redirect_to edit_shipping_address_path
    else
      render "edit"
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    @shipping_addresses = current_customer.shipping_addresses
    flash[:notice] = "配送先を削除しました"
    redirect_to shipping_addresses_path
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:post_code, :address, :name, :customer_id)
  end

end
