class Product < ApplicationRecord
	belongs_to :category
	belongs_to :brand
	belongs_to :store
	has_and_belongs_to_many :stores
	has_many :images , dependent: :destroy
	has_many :order_product
	has_many :orders, through: :order_product
	accepts_nested_attributes_for :images

	validates :title, :description, :price, :quantity, :category, :brand, :store, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0 }
	validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates_associated :category, :brand, :store
	scope :filter_by_query, -> (q) {where (["title like ? or description like ?","%#{q}%", "%#{q}%"])}
	scope :filter_by_category, -> (category_id) { where category_id: category_id }
	scope :filter_by_brand, -> (brand_id) { where brand_id: brand_id }
	scope :filter_by_price, -> (min, max) { where (["price between ? and ?",min,max]) }
	scope :filter_by_store, -> (store_id) { where store_id: store_id }

	paginates_per 12
end