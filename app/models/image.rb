class Image < ApplicationRecord
	belongs_to :product
	has_one_attached :image
	validates :path, presence: true
	validates_associated :product
end