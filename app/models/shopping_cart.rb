class ShoppingCart

	delegate :sub_total, to: :order

	def initialize(token:)
		@token = token
	end

	def order
		@order ||= Order.find_or_create_by(token: @token) do |order|
		  order.sub_total = 0
		end
	end

	  def items_count
    	order.items.sum(:quantity)
	  end

	def add_item(item_id:, quantity: 1)
		item = Item.find(item_id)

		order_item = order.items.find_or_initialize_by(
		  item_id: item_id
		)

		order_item.price = item.price
		order_item.quantity = quantity

		ActiveRecord::Base.transaction do
			order_item.save
			update_sub_total!
		end
	end

	def remove_item(id:)
		ActiveRecord::Base.transaction do		
	    	order.items.destroy(id)
	    	update_sub_total!
	    end
  	end


  	private
  	def update_sub_total!
  		order.sub_total = order.items.sum('quantity * price')
  		order.save
  	end
end