puts 'Run stores seeder ...'

AdminUser.where(role: AdminUser.roles['seller']).each do |user|
	Store.create(
		name: Faker::Company.name,
		summary: Faker::Lorem.paragraph(sentence_count: 5),
		admin_user: user
	)
end

puts "Stores seeder done successfully !\n\n"