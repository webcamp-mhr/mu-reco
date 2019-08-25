class AddPurchaseAddressToPurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_histories, :purchase_address, :text
  end
end
