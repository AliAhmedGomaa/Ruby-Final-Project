class OrderController < ApplicationController
	before_action :authenticate_user!
	def index
		@orders = current_user.orders
	end

	def create
		data = params.require(:order).permit(:address, :postcode, :city, :phone, :cart)
		cart = JSON.parse(data['cart'])
		products = Product.find(cart.pluck('id'))

		if products.length == 0 then
			redirect_to({ :controller => :checkout, :action => :index })
		elsif !check_quantity(products, cart) then
			redirect_to({ :controller => :checkout, :action => :index }, alert: 'Quantity is not available')
		else
			order = current_user.orders.create(
				address: data['address'],
				postcode: data['postcode'],
				city: data['city'],
				phone: data['phone'],
				status: Order.statuses['pending']
			)

			if !order.valid?
				redirect_to({ :controller => :checkout, :action => :index }, alert: 'Order is not valid')
			else
				products.each_with_index do |product, index|
					OrderProduct.create(
						order: order,
						product: product,
						quantity: cart[index]['quantity']
					)
					product.update(
						quantity: product.quantity - cart[index]['quantity']
					)
				end

				redirect_to({ :controller => :checkout, :action => :index }, notice: 'Order is placed')
			end
		end
	end

	private
	def check_quantity(products, cart)
		products.each_with_index do |product, index|
			if product.quantity < cart[index]['quantity'] then
				return false
			end
		end

		return true
	end
end