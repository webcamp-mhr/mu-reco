class Test < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :jacket_image, :string
    add_column :products, :jacket_image_id, :string
    add_column :discs, :product_id, :integer
  end
end
