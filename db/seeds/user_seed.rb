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

user = User.create(
	name: 'User',
	email: 'user@domain.com',
	password: '123456',
	password_confirmation: '123456',
	avatar: 'avatar-1.jpg'
)

FileUtils.mkdir_p(Rails.public_path.join("uploads/user/avatar/#{user.id}"))
FileUtils.cp(Rails.public_path.join('img/product-default.png'), Rails.public_path.join("uploads/user/avatar/#{user.id}/avatar-#{user.id}.jpg"))

4.times do |index|
	user = User.create(
		name: Faker::Name.name,
		email: Faker::Internet.safe_email,
		password: '123456',
		password_confirmation: '123456',
		avatar: "avatar-#{index + 2}.jpg"
	)

	FileUtils.mkdir_p(Rails.public_path.join("uploads/user/avatar/#{user.id}"))
	FileUtils.cp(Rails.public_path.join('img/product-default.png'), Rails.public_path.join("uploads/user/avatar/#{user.id}/avatar-#{user.id}.jpg"))
end

puts "Users seeder done successfully !\n\n"