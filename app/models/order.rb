class Order < ApplicationRecord
	has_many :items, class_name: 'OrderItem', dependent: :destroy
	has_many :order_items, class_name: 'OrderItem', dependent: :destroy
end