class RenameFromJacketImageToJacketImageIdOnPurchaseProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :purchase_products, :jacket_image, :jacket_image_id
  end
end
