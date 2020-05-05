class User < ApplicationRecord
	has_many :orders
	belongs_to :store, optional: true
end