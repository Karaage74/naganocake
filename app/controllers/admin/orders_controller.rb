class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def index
    @orders = Order.page(params[:page])
  end
  
  def update
    order = Order.find(params[:id])
		order_details = order.order_details
    order.update(order_params)

		if order.order_status == "payment_confirmation"
			order_details.update_all(making_status: "waiting_production")
		end
		redirect_to admin_order_path(order)
	end

  private
  
	def order_params
		params.require(:order).permit(:order_status)
	end
end
