class Order < ApplicationRecord
	belongs_to :user
	has_many :order_product
	has_many :products, through: :order_product

	validates :status, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }
	validates_associated :user
end