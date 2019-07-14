class CreatePurchaseProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_products do |t|
      t.string :user_name
      t.string :single_album_name
      t.string :jacket_image
      t.integer :prodcut_price
      t.string :label_name
      t.string :genre_name
      t.integer :purchase_quantity
      t.integer :subtotal

      t.timestamps
    end
  end
end
