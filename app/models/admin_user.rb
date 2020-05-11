class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :registerable 
  has_one :store
  validates :role, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  enum roles: { admin: 0, seller: 1 }

  def get_role
		AdminUser.roles.key(self.role)
  end

  def is_seller?
     AdminUser.roles.key(self.role) == 1
  end

  def self.get_Sellers
    AdminUser.where(role: AdminUser.roles['seller'])
  end

  def store_products
    if(self.store)
     self.store.products
    end
  end
  
end
