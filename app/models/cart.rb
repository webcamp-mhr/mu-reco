class Cart < ApplicationRecord

  belongs_to :user
  belongs_to :product

  validates :purchase_quantity, length:{ in: 1..100}  #購入枚数最大100個まで受付

  validates :user_id, presence: true, uniqueness: { scope: :product_id }
  # validates :product_id, uniquness: {scope: [:user_id]}

  # validates :check, presence: true
end
