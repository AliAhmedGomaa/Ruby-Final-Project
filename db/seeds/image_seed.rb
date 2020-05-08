puts 'Run images seeder ...'

Product.all.each do |product|
	3.times do |index|
		product.images.create(
			path: "product-#{product.id}-image-#{index + 1}.jpg"
		)
	end
end

puts "Images seeder done successfully !\n\n"