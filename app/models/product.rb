class Product < ApplicationRecord
	belongs_to :category
	belongs_to :brand
	has_and_belongs_to_many :stores
	has_many :images
	has_many :order_product
	has_many :orders, through: :order_product
end