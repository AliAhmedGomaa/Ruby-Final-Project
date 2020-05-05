class Product < ApplicationRecord
	belongs_to :category
	belongs_to :brand
	has_and_belongs_to_many :stores
	has_many :images
	has_many :order_product
	has_many :orders, through: :order_product

	validates :title, :description, :price, :quantity, :category, :brand, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates_associated :category, :brand
end