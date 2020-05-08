class Store < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :products

	validates :name, :summary, presence: true
	validates_associated :products, :user
end