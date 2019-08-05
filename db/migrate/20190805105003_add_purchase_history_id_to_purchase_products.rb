class AddPurchaseHistoryIdToPurchaseProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_products, :purchase_history_id, :integer
  end
end
