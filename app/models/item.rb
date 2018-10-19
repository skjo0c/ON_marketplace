class Item < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :name, :image, :price, :description, presence: true
	has_many :reviews
	ratyrate_rateable "item"
end