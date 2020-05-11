puts 'Run users seeder ...'

AdminUser.create(
	email: 'admin@domain.com',
	password: '123456',
	password_confirmation: '123456',
	role: AdminUser.roles['admin']
)

4.times do
	AdminUser.create(
		email: Faker::Internet.safe_email,
		password: '123456',
		password_confirmation: '123456',
		role: AdminUser.roles['seller']
	)
end

5.times do
	User.create(
		name: Faker::Name.name,
		email: Faker::Internet.safe_email,
		password: '123456',
		password_confirmation: '123456',
		avatar: 'path/to/image'
	)
end

puts "Users seeder done successfully !\n\n"