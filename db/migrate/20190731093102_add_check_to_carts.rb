class AddCheckToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :check, :boolean
  end
end
