class AddIndexCartsUserId < ActiveRecord::Migration[5.2]
  def change
  end

  add_index :carts, [:user_id, :product_id], unique: true
end
