class CartsController < ApplicationController

	# def show
 #     @cart = current_cart
 #   end

	# def add_to_cart
	# 	current_cart.add_item(params[:item_id])
	# 	redirect_to carts_path(current_cart.id)
	# end

	# def add_item(item_id)
	# 	item = items.where('item_id = ?', item_id).first
	# 	if item
	# 		# increase the quantity of product in cart
	# 		item.quantity + 1
	# 		save
	# 	else
	# 		# product does not exist in cart
	# 		cart.items << Item.new(item_id: item_id, quantity: 1)
	# 	end
	# 	save
	# end
end
