puts 'Run categories seeder ...'

10.times do
	Category.create(
		name: Faker::Commerce.department(max: 1)
	)
end

puts "Categories seeder done successfully !\n\n"