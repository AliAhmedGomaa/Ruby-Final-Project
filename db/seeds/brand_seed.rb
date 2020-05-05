puts 'Run brands seeder ...'

10.times do
	Brand.create(
		name: Faker::Company.name
	)
end

puts "Brands seeder done successfully !\n\n"