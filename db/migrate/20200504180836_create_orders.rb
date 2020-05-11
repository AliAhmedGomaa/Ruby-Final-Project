class CreateOrders < ActiveRecord::Migration[6.0]
	def change
		create_table :orders do |t|
			t.references :user, null: false, foreign_key: true
			t.text :address
			t.string :postcode
			t.string :city
			t.string :phone
			t.integer :status, :limit => 1

			t.timestamps
		end
	end
end