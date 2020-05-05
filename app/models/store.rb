class Store < ApplicationRecord
	has_many :users
	has_and_belongs_to_many :products
end