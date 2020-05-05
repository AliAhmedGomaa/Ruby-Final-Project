puts 'Run images seeder ...'

Product.all.each do |product|
	3.times do
		product.images.create(
			path: ''
		)
	end
end

puts "Images seeder done successfully !\n\n"