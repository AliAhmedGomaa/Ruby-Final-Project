class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :orders
	has_one :store

	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

	validates :name, :email, :password, presence: true
	validates :email, format: { with: EMAIL_REGEX, message: 'format is not valid' }, uniqueness: true
	validates :password, confirmation: true
	

	# enum roles: { admin: 0, seller: 1, buyer: 2 }

	# def get_role
	# 	User.roles.key(self.role)
	# end
end