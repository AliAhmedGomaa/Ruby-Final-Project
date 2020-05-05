puts 'Run orders seeder ...'

if Product.count > 0 then
	User.all.each do |user|
		5.times do
			order = user.orders.create(
				status: Faker::Number.between(from: 1, to: 4)
			)
			5.times do
				product = Product.order('rand()').first

				order_product = OrderProduct.new
				order_product.order = order
				order_product.product = product
				order_product.quantity = Faker::Number.between(from: 1, to: 100)
				order_product.save
			end
		end
	end
end

puts "Orders seeder done successfully !\n\n"