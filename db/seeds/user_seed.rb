puts 'Run users seeder ...'

User.create(
	name: 'Admin',
	email: 'admin@domain.com',
	password: '123456',
	password_confirmation: '123456',
	avatar: 'path/to/image',
	role: User.roles['admin']
)

9.times do
	User.create(
		name: Faker::Name.name,
		email: Faker::Internet.safe_email,
		password: '123456',
		password_confirmation: '123456',
		avatar: 'path/to/image',
		role: Faker::Number.between(from: 0, to: 2)
	)
end

puts "Users seeder done successfully !\n\n"