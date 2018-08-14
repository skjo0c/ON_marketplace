class Item < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :name, :image, :price, :description, presence: true
end
