class AddProductStatusToOrderProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :order_products, :product_status, :integer, :limit => 1
  end
end
