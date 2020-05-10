class Product < ApplicationRecord
	belongs_to :category
	belongs_to :brand
	has_and_belongs_to_many :stores
	has_many :images , dependent: :destroy
	has_many :order_product
	has_many :orders, through: :order_product
	accepts_nested_attributes_for :images
	validates :title, :description, :price, :quantity, :category, :brand, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 1 }
	validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates_associated :category, :brand

	scope :filter_by_category, -> (category_id) { where category_id: category_id }
	scope :filter_by_brand, -> (brand_id) { where brand_id: brand_id }
end