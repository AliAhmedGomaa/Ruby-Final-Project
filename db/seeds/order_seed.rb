puts 'Run orders seeder ...'

if Product.count > 0 then
	User.all.each do |user|
		5.times do
			order = user.orders.create(
				status: Faker::Number.between(from: 1, to: 4)
			)
			5.times do
				product = Product.order('rand()').first

				OrderProduct.create(
					order: order,
					product: product,
					quantity: Faker::Number.between(from: 1, to: 100)
				)
			end
		end
	end
end

puts "Orders seeder done successfully !\n\n"