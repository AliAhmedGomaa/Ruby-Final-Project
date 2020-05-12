class Image < ApplicationRecord
	belongs_to :product
	mount_uploader :path , ProductImageUploader
	validates :path
	validates_associated :product
end