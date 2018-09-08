class ReviewsController < ApplicationController

	before_action :authenticate_user!, only: :create

	def create
		@item = Item.find(params[:item_id])
		@review = @item.reviews.create(review_params.merge(user_id: current_user.id))

		if @review.valid?
			redirect_to item_path(@item.id)
		else
			flash[:alert] = "Invalid attributes"
			redirect_to root_path
		end
	end

	private

	def review_params
		params.require(:review).permit(:review, :item_id)
	end
end
