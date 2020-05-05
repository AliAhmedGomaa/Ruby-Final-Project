class User < ApplicationRecord
	has_many :orders
	belongs_to :store, optional: true

	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

	validates :name, :email, :password, :password_confirmation, :role, presence: true
	validates :email, format: { with: EMAIL_REGEX, message: 'format is not valid' }, uniqueness: true
	validates :password, confirmation: true
	validates :role, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }
	validates_associated :store
end