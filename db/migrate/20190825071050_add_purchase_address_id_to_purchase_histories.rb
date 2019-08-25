class AddPurchaseAddressIdToPurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_histories, :purchase_address_id, :integer
  end
end
