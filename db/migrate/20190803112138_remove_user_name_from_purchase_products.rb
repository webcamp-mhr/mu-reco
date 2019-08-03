class RemoveUserNameFromPurchaseProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchase_products, :user_name, :string
  end
end
