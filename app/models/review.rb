class Review < ApplicationRecord
	belongs_to :item, dependent: :destroy
	belongs_to :user, dependent: :destroy

	validates :review, :user_id, :item_id, presence: true
end
