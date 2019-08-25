class RemoveAddressIdFromPurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchase_histories, :address_id, :integer
  end
end
