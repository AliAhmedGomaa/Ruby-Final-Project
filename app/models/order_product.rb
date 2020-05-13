class OrderProduct < ApplicationRecord
	belongs_to :order
	belongs_to :product
	enum statuses: { pending: 0, confirmed: 1, delivered: 2 }

	def get_status
		OrderProduct.statuses.key(self.product_status)
	end

	validates :product_status, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }
	validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates_associated :order, :product
end