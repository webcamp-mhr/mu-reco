class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.integer :postcode
      t.text :address
      t.integer :address_priority

      t.timestamps
    end
  end
end
