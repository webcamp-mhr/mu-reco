class AddPaymentStatusToPurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_histories, :payment_status, :integer
  end
end
