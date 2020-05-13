puts 'Run orders seeder ...'

if Product.count > 0 then
	User.all.each do |user|
		5.times do
			order = user.orders.create(
				address: Faker::Address.street_address,
				postcode: Faker::Number.between(from: 10000, to: 60000).to_s,
				city: Faker::Address.city,
				phone: Faker::PhoneNumber.cell_phone,
				status: Faker::Number.between(from: 0, to: 2)
			)
			5.times do
				product = Product.order('RANDOM()').first

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