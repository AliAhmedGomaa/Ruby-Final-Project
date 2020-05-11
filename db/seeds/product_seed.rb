puts 'Run products seeder ...'

if Category.count > 0 and Brand.count > 0 then
	Store.all.each do |store|
		5.times do
			category = Category.order('rand()').first
			brand = Brand.order('rand()').first
			store.products.create(
				title: Faker::Commerce.product_name,
				description: Faker::Lorem.paragraph(sentence_count: 5),
				price: Faker::Commerce.price,
				quantity: Faker::Number.between(from: 1, to: 100),
				category: category,
				brand: brand
			)
		end
	end
end

puts "Products seeder done successfully !\n\n"