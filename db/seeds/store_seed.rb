puts 'Run stores seeder ...'

10.times do
	store = Store.create(
		name: Faker::Company.name,
		summary: Faker::Lorem.paragraph(sentence_count: 5)
	)
end

puts "Stores seeder done successfully !\n\n"