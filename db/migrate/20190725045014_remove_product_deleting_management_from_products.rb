class RemoveProductDeletingManagementFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :product_deleting_management, :boolean
  end
end
