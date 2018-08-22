class OrdersController < ApplicationController

	before_action :authenticate_admin!, only: [:show]

	def new
		@order = current_cart.order
	end

	def create
		@order = current_cart.order

		if @order.update_attributes(order_params.merge(status: 'open'))
			session[:cart_token] = nil
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@orders = Order.includes(:order_items)
	end
	
	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to :controller => 'orders', :action => 'show'
	end

	private

	def order_params
		params.require(:order).permit(:first_name,:last_name,:mobile,:address)
	end
end


