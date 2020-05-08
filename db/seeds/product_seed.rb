puts 'Run products seeder ...'

if Brand.count > 0 then
	Category.all.each do |category|
		5.times do
			brand = Brand.order('rand()').first
			product = category.products.create(
				title: Faker::Commerce.product_name,
				description: Faker::Lorem.paragraph(sentence_count: 5),
				price: Faker::Commerce.price,
				quantity: Faker::Number.between(from: 1, to: 100),
				brand: brand
			)
		end
	end
end

puts "Products seeder done successfully !\n\n"