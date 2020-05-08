class Image < ApplicationRecord
	belongs_to :product
	mount_uploader :path , ProductImageUploader
	validates :path, presence: true
	validates_associated :product
end