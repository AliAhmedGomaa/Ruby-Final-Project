class Store < ApplicationRecord
	belongs_to :admin_user
	has_many :products

	validates :name, :summary, presence: true
	validates_associated :admin_user
end