require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	test 'Should not save product without title' do
		product = Product.new

		product.description = Faker::Lorem.paragraph(sentence_count: 5)
		product.price = Faker::Commerce.price
		product.quantity = Faker::Number.between(from: 1, to: 100)
		product.category = Category.order('rand()').first
		product.brand = Brand.order('rand()').first
		product.store = Store.order('rand()').first

		assert_not product.save, 'Saved the product without a title'
	end

	test 'Should not save product without description' do
		product = Product.new

		product.title = Faker::Commerce.product_name
		product.price = Faker::Commerce.price
		product.quantity = Faker::Number.between(from: 1, to: 100)
		product.category = Category.order('rand()').first
		product.brand = Brand.order('rand()').first
		product.store = Store.order('rand()').first

		assert_not product.save, 'Saved the product without a description'
	end

	test 'Should not save product without price' do
		product = Product.new

		product.title = Faker::Commerce.product_name
		product.description = Faker::Lorem.paragraph(sentence_count: 5)
		product.quantity = Faker::Number.between(from: 1, to: 100)
		product.category = Category.order('rand()').first
		product.brand = Brand.order('rand()').first
		product.store = Store.order('rand()').first

		assert_not product.save, 'Saved the product without a price'
	end

	test 'Should not save product with non numeric price' do
		product = Product.new

		product.title = Faker::Commerce.product_name
		product.description = Faker::Lorem.paragraph(sentence_count: 5)
		product.price = ''
		product.quantity = Faker::Number.between(from: 1, to: 100)
		product.category = Category.order('rand()').first
		product.brand = Brand.order('rand()').first
		product.store = Store.order('rand()').first

		assert_not product.save, 'Saved the product with non numeric price'
	end

	test 'Should not save product with price less than zero' do
		product = Product.new

		product.title = Faker::Commerce.product_name
		product.description = Faker::Lorem.paragraph(sentence_count: 5)
		product.price = -1
		product.quantity = Faker::Number.between(from: 1, to: 100)
		product.category = Category.order('rand()').first
		product.brand = Brand.order('rand()').first
		product.store = Store.order('rand()').first

		assert_not product.save, 'Saved the product with price less than zero'
	end

	test 'Should not save product without quantity' do
		product = Product.new

		product.title = Faker::Commerce.product_name
		product.description = Faker::Lorem.paragraph(sentence_count: 5)
		product.price = Faker::Commerce.price
		product.category = Category.order('rand()').first
		product.brand = Brand.order('rand()').first
		product.store = Store.order('rand()').first

		assert_not product.save, 'Saved the product without a quantity'
	end

	test 'Should not save product with non numeric quantity' do
		product = Product.new

		product.title = Faker::Commerce.product_name
		product.description = Faker::Lorem.paragraph(sentence_count: 5)
		product.price = Faker::Commerce.price
		product.quantity = ''
		product.category = Category.order('rand()').first
		product.brand = Brand.order('rand()').first
		product.store = Store.order('rand()').first

		assert_not product.save, 'Saved the product with non numeric quantity'
	end

	test 'Should not save product with quantity less than one' do
		product = Product.new

		product.title = Faker::Commerce.product_name
		product.description = Faker::Lorem.paragraph(sentence_count: 5)
		product.price = Faker::Commerce.price
		product.quantity = 0
		product.category = Category.order('rand()').first
		product.brand = Brand.order('rand()').first
		product.store = Store.order('rand()').first

		assert_not product.save, 'Saved the product with quantity less than one'
	end

	test 'Should not save product without category' do
		product = Product.new

		product.title = Faker::Commerce.product_name
		product.description = Faker::Lorem.paragraph(sentence_count: 5)
		product.price = Faker::Commerce.price
		product.quantity = Faker::Number.between(from: 1, to: 100)
		product.brand = Brand.order('rand()').first
		product.store = Store.order('rand()').first

		assert_not product.save, 'Saved the product without a category'
	end

	test 'Should not save product without brand' do
		product = Product.new

		product.title = Faker::Commerce.product_name
		product.description = Faker::Lorem.paragraph(sentence_count: 5)
		product.price = Faker::Commerce.price
		product.quantity = Faker::Number.between(from: 1, to: 100)
		product.category = Category.order('rand()').first
		product.store = Store.order('rand()').first

		assert_not product.save, 'Saved the product without a brand'
	end

	test 'Should not save product without store' do
		product = Product.new

		product.title = Faker::Commerce.product_name
		product.description = Faker::Lorem.paragraph(sentence_count: 5)
		product.price = Faker::Commerce.price
		product.quantity = Faker::Number.between(from: 1, to: 100)
		product.category = Category.order('rand()').first
		product.brand = Brand.order('rand()').first

		assert_not product.save, 'Saved the product without a store'
	end

	# test 'Should not update product without title' do
	# 	product = Product.order('rand()').first

	# 	product.title = nil

	# 	assert_not product.save, 'Updated the product without a title'
	# end

	# test 'Should not delete product assigned to an order' do
	# 	order = Order.order('rand()').first
	# 	product = order.products.order('rand()').first

	# 	assert_not product.destroy, 'Deleted the product assigned to an order'
	# end
end
