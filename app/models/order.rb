class Order < ApplicationRecord
	belongs_to :user
	has_many :order_product
	has_many :products, through: :order_product
end