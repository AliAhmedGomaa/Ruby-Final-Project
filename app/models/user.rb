class User < ApplicationRecord
	has_many :orders
	has_one :store

	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

	validates :name, :email, :password, :role, presence: true
	validates :email, format: { with: EMAIL_REGEX, message: 'format is not valid' }, uniqueness: true
	validates :password, confirmation: true
	validates :role, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }

	enum roles: { admin: 0, seller: 1, buyer: 2 }

	def get_role
		User.roles.key(self.role)
	end
end