class AddDiscIdToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :disc_id, :integer
  end
end
