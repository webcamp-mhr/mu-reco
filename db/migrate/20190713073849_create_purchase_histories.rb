class CreatePurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_histories do |t|
      t.integer :user_id
      t.integer :total_price
      t.integer :address_id
      t.integer :delivery_status

      t.timestamps
    end
  end
end
