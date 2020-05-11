puts 'Run images seeder ...'

Product.all.each do |product|
	3.times do |index|
		image = product.images.create(
			path: "product-#{product.id}-image-#{index + 1}.jpg"
		)

		FileUtils.mkdir_p(Rails.public_path.join("uploads/image/path/#{image.id}"))
		FileUtils.cp(Rails.public_path.join('img/product-default.png'), Rails.public_path.join("uploads/image/path/#{image.id}/product-#{product.id}-image-#{index + 1}.jpg"))
	end
end

puts "Images seeder done successfully !\n\n"