puts 'Run users seeder ...'

10.times do
	User.create(
		name: Faker::Name.name,
		email: Faker::Internet.safe_email,
		password: '123456',
		password_confirmation: '123456',
		avatar: 'path/to/image',
		
	)
end

puts "Users seeder done successfully !\n\n"