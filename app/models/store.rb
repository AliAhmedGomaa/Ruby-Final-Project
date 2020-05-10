class Store < ApplicationRecord
	belongs_to :admin_user
	has_and_belongs_to_many :products

	validates :name, :summary, presence: true
	validates_associated :products, :admin_user
end