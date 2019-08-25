class AddPurchasePostcodeToPurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_histories, :purchase_postcode, :integer
  end
end
