class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :artist_id
      t.string :single_album_name
      t.string :jacket_image
      t.integer :price
      t.integer :label_id
      t.integer :genre_id
      t.integer :stock_quantity
      t.integer :sales_status
      t.boolean :product_deleting_management

      t.timestamps
    end
  end
end
