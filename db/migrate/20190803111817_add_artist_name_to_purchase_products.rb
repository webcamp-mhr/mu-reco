class AddArtistNameToPurchaseProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_products, :artist_name, :string
  end
end
