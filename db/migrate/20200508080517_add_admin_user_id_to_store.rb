class AddAdminUserIdToStore < ActiveRecord::Migration[6.0]
  def change
    change_table :stores do |t|
      t.references :admin_user, null: false, foreign_key: true

    end
  end
end
