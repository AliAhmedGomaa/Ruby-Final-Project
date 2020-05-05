class CreateProducts < ActiveRecord::Migration[6.0]
	def change
		create_table :products do |t|
			t.string :title
			t.text :description
			t.float :price
			t.integer :quantity
			t.references :category, null: false, foreign_key: true
			t.references :brand, null: false, foreign_key: true

			t.timestamps
		end
	end
end