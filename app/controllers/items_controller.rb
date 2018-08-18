class ItemsController < ApplicationController

	before_action :authenticate_admin!, only: [:create, :delete]

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.create(item_params)

		if @item.valid?
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :image, :price, :description)
	end
	
end
