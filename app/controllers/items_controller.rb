class ItemsController < ApplicationController

	before_action :authenticate_admin!, only: [:create, :delete]

	def index
		@newitems = Item.where('created_at > ?', 117.days.ago)
		
		if params[:search]
			@items = Item.where('name ILIKE ?', "%#{params[:search]}%").order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
		else
			@items = Item.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
		end
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

	def show
		@item = Item.find(params[:id])
	end

	private

	def item_params
		params.require(:item).permit(:name, :image, :price, :description)
	end
	
end
