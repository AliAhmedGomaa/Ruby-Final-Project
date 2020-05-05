puts 'Run users seeder ...'

User.create(
	name: 'Admin',
	email: 'admin@domain.com',
	password: '123456',
	password_confirmation: '123456',
	avatar: 'path/to/image',
	role: 1
)

9.times do
	store = nil
	role = Faker::Number.between(from: 1, to: 4)

	if role == 2 then	# Seller
		store = Store.order('rand()').first
	end

	User.create(
		name: Faker::Name.name,
		email: Faker::Internet.safe_email,
		password: '123456',
		password_confirmation: '123456',
		avatar: 'path/to/image',
		role: role,
		store: store
	)
end

puts "Users seeder done successfully !\n\n"