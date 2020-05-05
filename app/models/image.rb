class Image < ApplicationRecord
	belongs_to :product

	validates :path, presence: true
	validates_associated :product
end