class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :purchase_quantity
      t.integer :user_id

      t.timestamps
    end
  end
end
