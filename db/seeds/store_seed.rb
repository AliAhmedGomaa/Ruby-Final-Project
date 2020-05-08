puts 'Run stores seeder ...'

User.where(role: User.roles['seller']).each do |user|
	store = Store.create(
		name: Faker::Company.name,
		summary: Faker::Lorem.paragraph(sentence_count: 5),
		user: user
	)

	5.times do
		product = Product.order('rand()').first
		store.products << product
	end
end

puts "Stores seeder done successfully !\n\n"