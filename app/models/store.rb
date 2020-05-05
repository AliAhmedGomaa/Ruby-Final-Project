class Store < ApplicationRecord
	has_many :users
	has_and_belongs_to_many :products

	validates :name, :summary, presence: true
	validates_associated :products
end