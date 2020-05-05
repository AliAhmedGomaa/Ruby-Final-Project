class CreateProductStore < ActiveRecord::Migration[6.0]
	def change
		create_join_table :products, :stores do |t|
			t.timestamps
		end
	end
end